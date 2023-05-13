//
//  SearchViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/19/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    var results = [Movie]()

    private let searchBar: UISearchBar = {
       let searchbar = UISearchBar()
           searchbar.translatesAutoresizingMaskIntoConstraints = false
           searchbar.showsCancelButton = false
           return searchbar
    }()
    
    private let table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CustomSearchCell.self, forCellReuseIdentifier: CustomSearchCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        table.dataSource = self
        table.delegate = self
        navsetUp()
        view.addSubview(searchBar)
        view.addSubview(table)
        setUpConstraints()
        
    }
    
    @objc func dismissKeyboard(){
        searchBar.resignFirstResponder()
    }
    
    
    func navsetUp() {
        navigationItem.title = "Movie Search"
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .link
        navBarAppearance.titleTextAttributes = [.foregroundColor : UIColor.white]
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.compactAppearance = navBarAppearance
        
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate(
            [
             searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
             table.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
             table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             table.bottomAnchor.constraint(equalTo: view.bottomAnchor)
             
            ])
    }
    
    func fetchWithQuery(query: String) {
        Network.shared.fetchResults(queryString: query) { [weak self] result in
            switch result {
            case .success(let welcome):
                self?.results = welcome.results
                DispatchQueue.main.async {
                    self?.table.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func presentDetailVc(movie: Movie) {
        let vc = MovieDetailViewController()
        vc.configureDetail(movie: movie)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomSearchCell.identifier, for: indexPath) as? CustomSearchCell else { return UITableViewCell() }
        if indexPath.row < results.count {
            cell.configure(movie: results[indexPath.row])
        }
       
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        searchBar.resignFirstResponder()
        presentDetailVc(movie: results[indexPath.row])
        
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText.count > 0  else {
            searchBar.showsCancelButton = false
            results = []
            table.reloadData()
            return }
        fetchWithQuery(query: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
         searchBar.showsCancelButton = true
         let cBtn = searchBar.value(forKey: "cancelButton") as! UIButton
          cBtn.setTitle("Go", for: .normal)
       
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}
