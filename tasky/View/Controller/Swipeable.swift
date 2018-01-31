//
//  Swipeable.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/31/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import UIKit
import SwipeCellKit

class Swipeable: UITableViewController, SwipeTableViewCellDelegate {

    var cell: UITableViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(SwipeTableViewCell.self)
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else {
            
            let shareAction = SwipeAction(style: .default, title: "Share") { (Action, indexPath) in
                print("shareAction")
            }
            shareAction.image = UIImage(named: "unread")
            
            return [shareAction]
            
        }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            print("welcome")
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath as NSIndexPath) as SwipeTableViewCell
        cell.delegate = self
        return cell
    }
    
}
