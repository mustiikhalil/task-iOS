//
//  TableVM.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/29/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import Foundation
import RealmSwift


class TableVM {
    
    var array: Results<Item>?
    
    func fetch(from objectInstance: CategoryOfItem){
        array = objectInstance.items.sorted(byKeyPath: "name", ascending: true)
    }
    
    func add(newItem: String, type: CategoryOfItem?){
        
        let item = Item()
        item.name = newItem
        item.didCheck = false
        item.importance = 2
        database.saveByAppend(to: item, type: type!)
        
    }
    
    func updateChecker(itemAt item: Item?){
        if let currentItem = item {
          
            do {
                try realm.write {
                    currentItem.didCheck = !currentItem.didCheck
                  
                }
                
            } catch {
                
                print(" error updating item")
            }
        }
        
        
    }

}

