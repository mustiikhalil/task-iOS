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
        
        performSegue(withIdentifier: "toItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destVC = segue.destination as! TableVC
        if let indexPath = tableView.indexPathForSelectedRow {
            destVC.selectedCat = categoryVM.array?[indexPath.row]
        }
    }
    
    @IBAction func addCat(_ sender: UIBarButtonItem) {
        
        let alert = AlertUI(tableView: self.tableView, Controllertitle: "Add a Category")
        alert.showAlertAction(category: categoryVM)
        present(alert.alert, animated: true, completion: nil)
        
        
    }
    
}


