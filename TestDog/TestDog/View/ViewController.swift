//
//  ViewController.swift
//  TestDog
//
//  Created by priyatham reddy on 10/27/22.
//

import UIKit

class ViewController: UIViewController {
    
    var welcomeVm = WelcomeViewModel(welcome: Welcome(message: ["" : [""]]))

    private let table: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        view.addSubview(table)
        table.frame = view.bounds
        welcomeVm.fetchDogs()
        
    }
    
    

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
       //guard let welcomeVm = welcomeVm else { return 0}
        return welcomeVm.model2?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // guard let welcomeVm = welcomeVm else { return 0}
        guard let model2 = welcomeVm.model2 else { return 0}
        let numArr = model2[section].names
        return numArr.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
       // guard let welcomeVm = welcomeVm else { return ""}
       
        guard let model2 = welcomeVm.model2 else { return ""}
        
        return "Section: \(model2[section].alpha)"
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      //  guard let welcomeVm = welcomeVm else { return UITableViewCell()}
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = welcomeVm.model2?[indexPath.section].names[indexPath.row]
        cell.detailTextLabel?.text = welcomeVm.welcome?.message[welcomeVm.dogs[indexPath.row]]?.joined(separator: ",")
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true )
        
        let vc = DetailVcViewController()
        
        present(vc, animated: true)
        
    }
}

extension ViewController: ViewModelDelegate {
    func didReceiveData(model2: [Model2], dogs: [String], welcome: Welcome) {
        welcomeVm = WelcomeViewModel(welcome: welcome)
        welcomeVm.delegate = self
        DispatchQueue.main.async {
            self.table.reloadData()
        }
    }
    
    
}

