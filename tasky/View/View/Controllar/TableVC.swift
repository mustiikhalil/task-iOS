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
        
        cell.ConfigureCell(at: tableVM.array[indexPath.row])
        return cell

    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            
           tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        } else {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
        
//        let path = Path.init(id: "TableVC", type: "items")
//        rout.push(id: path , nav: self)
    }
}

