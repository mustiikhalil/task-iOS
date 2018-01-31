//
//  MainVC.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/30/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import UIKit
import SwipeCellKit
import ChameleonFramework


class MainVC: SwipeTableViewController {

    var categoryVM = CategoryVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80.0
        tableView.register(SwipeTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.tableFooterView = UIView()
        categoryVM.fetch()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categoryVM.array?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.textLabel?.text = categoryVM.getElement(at: indexPath.row)?.type
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
    
    override func updateModel(at indexPath: IndexPath) {
        self.categoryVM.remove(at: indexPath.row)
    }
        
}


