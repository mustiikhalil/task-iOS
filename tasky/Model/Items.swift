//
//  Items.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/29/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var didCheck: Bool = false
    @objc dynamic var name: String = ""
    @objc dynamic var importance: Int16 = 0
    
    var parentCategory = LinkingObjects(fromType: CategoryOfItem.self, property: "items")
}
