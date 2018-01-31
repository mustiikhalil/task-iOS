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

class TableVC: UITableViewController {
   

    var tableVM = TableVM()
    var selectedCat: CategoryOfItem? {
        didSet{
            tableVM.fetch(from: selectedCat!)
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
    
    //Mark - Table View Data Source
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            self.tableVM.remove(at: indexPath.row)
            action.fulfill(with: .delete)
        }
        
        // customize the action appearance
        deleteAction.image = UIImage(named: "delete")
        
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeTableOptions {
        var options = SwipeTableOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .border
        return options
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableVM.array?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
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

