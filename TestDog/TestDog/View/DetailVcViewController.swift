//
//  DetailVcViewController.swift
//  TestDog
//
//  Created by priyatham reddy on 10/27/22.
//

import UIKit

class DetailVcViewController: UIViewController, UITableViewDataSource {
   
    private let table: UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell1")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        table.frame = view.bounds
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        cell.textLabel?.text = "tets"
        
        return cell 
    }
    
}
