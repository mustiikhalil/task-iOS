//
//  AlertUI.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/31/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import UIKit

class AlertUI{
    
    var textField: UITextField!
    var alert: UIAlertController!
    var alertAction: UIAlertAction?
    var table: UITableView!
    var dismiss: UIAlertAction?
    
    init(tableView: UITableView, Controllertitle: String) {
        alert = UIAlertController(title: Controllertitle, message: "Please add an Item to the list", preferredStyle: .alert)
        textField = UITextField()
        table = tableView
        alertAction = UIAlertAction()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {}
    
    func showAlertAction(category: CategoryVM){
        
        alertAction = UIAlertAction(title: "Add", style: .default){
            (action) in
            
            if self.textField.text! != ""{
                category.add(newItem: self.textField.text!)
            }
            self.table.reloadData()
            
        }
        dismiss = UIAlertAction(title: "dismiss", style: .cancel, handler: { (action) in
            
        })
        finish()
    }
    
    func showAlertAction(item: TableVM, selectedCat: CategoryOfItem){
        
        alertAction = UIAlertAction(title: "Add", style: .default){
            (action) in

            item.add(newItem: self.textField.text!, type: selectedCat)
            self.table.reloadData()
            
        }
        dismiss = UIAlertAction(title: "dismiss", style: .cancel, handler: { (action) in
            
        })

        finish()
    }
    
    func finish(){
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new Item"
            self.textField = alertTextField
        }
        alert.addAction(alertAction!)
        alert.addAction(dismiss!)
    }
}

