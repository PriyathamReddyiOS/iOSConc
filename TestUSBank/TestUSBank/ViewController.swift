//
//  ViewController.swift
//  TestUSBank
//
//  Created by priyatham reddy on 10/14/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var driverName = [String]()
    var mainData: Welcome?
    
    private let table: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        table.frame = view.bounds
        table.dataSource = self
        
        fetch { mainData in
            print(mainData)
            mainData.mrData.raceTable.races.forEach { race in
                race.results.sorted(by: { a, b in
                    Int(a.fastestLap.rank)! < Int(b.fastestLap.rank)!
                }).forEach({ result in
                    print(result)
                    self.driverName.append(result.driver.givenName)
                })
            }
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
        
    }
    
    func fetch(completion: @escaping ((Welcome) -> Void)) {
        let decoder = JSONDecoder()
        let url = Bundle.main.url(forResource: "jsonformatter", withExtension: "txt")
        guard let url = url else { return }
        let data = try? Data(contentsOf: url)
        guard let data = data else { return }
        let decodedData = try? decoder.decode(Welcome.self, from: data)
        if let mainData = decodedData {
            completion(mainData)
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return driverName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = driverName[indexPath.row]
        return cell
    }


}

