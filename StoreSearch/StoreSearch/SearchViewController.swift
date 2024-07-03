//
//  ViewController.swift
//  StoreSearch
//
//  Created by Douglas Jasper on 2024-07-02.
//

import UIKit

class SearchViewController: UIViewController {
    
    var searchResults = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.contentInset = UIEdgeInsets(top: 51, left: 0, bottom: 0, right: 0)
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!


}

// MARK: - Search Bar Delegate
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
      searchBar.resignFirstResponder()
      searchResults = []
      for i in 0...2 {
        searchResults.append(
          String(
            format: "Fake Result %d for '%@'", i, searchBar.text!
          )
        )
      }
      tableView.reloadData()
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
      return .topAttached
    }

}

// MARK: - Table View Delegate
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(
      _ tableView: UITableView,
      numberOfRowsInSection section: Int
    ) -> Int {
      return searchResults.count
    }

    func tableView(
      _ tableView: UITableView,
      cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
      let cellIdentifier = "SearchResultCell"
      
      var cell = tableView.dequeueReusableCell(
        withIdentifier: cellIdentifier)
      if cell == nil {
        cell = UITableViewCell(
          style: .default, reuseIdentifier: cellIdentifier)
      }
        cell?.textLabel!.text = searchResults[indexPath.row]
        return cell!
        
    }

}


