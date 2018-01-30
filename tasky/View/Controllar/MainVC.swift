//
//  MainVC.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/30/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import UIKit

class MainVC: UITableViewController {

    // setting ViewModel instance
    var categoryVM = CategoryVM()
    
    
    // MARK - getting data to load to the screen
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryVM.fetch()
        tableView.register(CategoryVCell.self)
    }
    
    
    // MARK - table view items
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryVM.array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath as NSIndexPath) as CategoryVCell
        cell.configure(with: categoryVM.array[indexPath.row])
        
        return cell
        
    }
    
    
    
    // MARK - adding category
    @IBAction func addCatg(_ sender: Any) {
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
