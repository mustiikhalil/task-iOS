//
//  MainVC.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/30/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import UIKit
import SwipeCellKit

class MainVC: UITableViewController, SwipeTableViewCellDelegate {

    var categoryVM = CategoryVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        database.deleteAll()
        categoryVM.fetch()
        tableView.register(TypeOfItems.self)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categoryVM.array?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath as NSIndexPath) as TypeOfItems
        cell.configure(item: categoryVM.getElement(at: indexPath.row))
        cell.delegate = self
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
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else {
            
            let shareAction = SwipeAction(style: .default, title: "Share") { (Action, indexPath) in
                print("share")
                
            }
            shareAction.image = UIImage(named: "unread")

            return [shareAction]
            
        }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            self.categoryVM.remove(at: indexPath.row)
            action.fulfill(with: .delete)
        }
        
        // customize the action appearance
        deleteAction.image = UIImage(named: "delete")
        
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeTableOptions {
        var options = SwipeTableOptions()
        options.transitionStyle = .border
        
        guard orientation == .right else {return options}
        options.expansionStyle = .destructive
        return options
    }
    
}


