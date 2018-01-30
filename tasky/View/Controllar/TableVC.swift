//
//  ViewController.swift
//  tasky
//
//        let path = Path.init(id: "TableVC", type: "items")
//        rout.push(id: path , nav: self)
//  Created by Mustafa Khalil on 1/29/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//


import UIKit

var rout = Routing()

class TableVC: UITableViewController {
    
    var tableVM = ItemTableVM()
    var selectedCat: Cat? {
        didSet{
            
            if let selected = selectedCat?.type {
                tableVM.fetch(givenCat: selected)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(ItemVCell.self)
    }
    
    
    //Mark - Table View Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableVM.array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath as NSIndexPath) as ItemVCell
        let data = tableVM.array[indexPath.row]
        cell.configure(with: data)
        cell.accessoryType = data.didCheck ? .checkmark : .none
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableVM.didChange(at: indexPath.row)
//        tableVM.remove(at: indexPath.row)
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    // Mark - Adding items to myTasks
    
    @IBAction func addNewItems(_ sender: Any) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add Item", message: "Please add an Item to the list", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Add", style: .default){
            (action) in
            
            self.tableVM.add(newItem: textField.text!, parentCat: self.selectedCat!)
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


// Mark - Search bar methods

extension TableVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        tableVM.Search(text: searchBar.text!,givenCat: (selectedCat?.type!)!)
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0{
            tableVM.fetch(givenCat: (selectedCat?.type!)!)
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
            
        }
        else{
            tableVM.Search(text: searchBar.text!,givenCat: (selectedCat?.type!)!)
        }
    }
    
}

