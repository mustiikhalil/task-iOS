//
//  TableVM.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/29/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import Foundation
import RealmSwift

struct TableVM {
    var array: Results<Item>?
    init() {
       
    }
    mutating func add(newItem: String){
        let item = Item()
        item.name = newItem
        item.didCheck = false
        item.importance = 2
        save(to: item)
    }
    
}

