//
//  ViewController.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/29/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import UIKit
import RealmSwift

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
        
        tableView.register(ItemCell.self)
    }
    
    
    //Mark - Table View Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableVM.array?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath as NSIndexPath) as ItemCell
        if let data = tableVM.array?[indexPath.row]{
            cell.ConfigureCell(at: data)
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


