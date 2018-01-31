//
//  MainVC.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/30/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import UIKit

class MainVC: UITableViewController {

    var categoryVM = CategoryVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryVM.fetch()
        categoryVM.delete()
        tableView.register(TypeOfItems.self)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryVM.array?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath as NSIndexPath) as TypeOfItems
        cell.configure(item: categoryVM.getElement(at: indexPath.row))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    @IBAction func addCat(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add Item", message: "Please add an Item to the list", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Add", style: .default){
            (action) in
            
            self.categoryVM.add(newItem: textField.text!)
            
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
