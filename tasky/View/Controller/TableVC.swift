//
//  ViewController.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/29/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import UIKit
import RealmSwift
import SwipeCellKit

class TableVC: SwipeTableViewController {
   

    var tableVM = TableVM()
    var selectedCat: CategoryOfItem? {
        didSet{
            tableVM.fetch(from: selectedCat!)
            tableView.reloadData()
            self.navigationItem.title = selectedCat?.type
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80.0
        tableView.register(SwipeTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.tableFooterView = UIView()
        
    }
    
    
    //Mark - Table View Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableVM.array?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        if let data = tableVM.array?[indexPath.row]{
            cell.textLabel?.text = data.name
            cell.accessoryType = data.didCheck ? .checkmark : .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableVM.updateChecker(itemAt: tableVM.array?[indexPath.row])
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    @IBAction func addNewItems(_ sender: Any) {
        
        let alert = AlertUI(tableView: self.tableView, Controllertitle: "Add a New Item")
        alert.showAlertAction(item: tableVM, selectedCat: selectedCat!)
        present(alert.alert, animated: true, completion: nil)
        
    }
    
    override func updateModel(at indexPath: IndexPath) {
        tableVM.remove(at: indexPath.row)
    }

}

extension TableVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        tableVM.array = tableVM.array?.filter("name CONTAINS[cd] %@",searchBar.text!).sorted(byKeyPath: "name", ascending: true)
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text?.count == 0 {
            
            tableVM.fetch(from: selectedCat!)
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
        
    }
}

