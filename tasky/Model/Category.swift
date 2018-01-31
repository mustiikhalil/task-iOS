//
//  Category.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/30/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import Foundation
import RealmSwift

class CategoryOfItem: Object {
    
    @objc dynamic var type: String = ""
    let items = List<Item>()
    
}
