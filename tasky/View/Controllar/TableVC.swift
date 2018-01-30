//
//  ViewController.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/29/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import UIKit

var rout = Routing()

class TableVC: UITableViewController {
    
    var tableVM = TableVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CategoryTVC.self)
    }
    
    
    //Mark - Table View Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableVM.array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath as NSIndexPath) as CategoryTVC
        let data = tableVM.array[indexPath.row]
        
        cell.ConfigureCell(at: data)
        
        cell.accessoryType = data.didCheck! ? .checkmark : .none
        
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableVM.array[indexPath.row].didCheck = !(tableVM.array[indexPath.row].didCheck!)
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        //        let path = Path.init(id: "TableVC", type: "items")
        //        rout.push(id: path , nav: self)
    }
    
    @IBAction func addNewItems(_ sender: Any) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add Item", message: "Please add an Item to the list", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Add", style: .default){
            (action) in
            self.tableVM.add(newItem: textField.text!)
            
            self.tableView.reloadData()
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new Item"
            textField = alertTextField
        }
        alert.addAction(alertAction)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
}

