//
//  ModelItem+CoreDataProperties.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/30/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//
//

import Foundation
import CoreData


extension ModelItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ModelItem> {
        return NSFetchRequest<ModelItem>(entityName: "ModelItem")
    }

    @NSManaged public var didCheck: Bool
    @NSManaged public var importance: Int16
    @NSManaged public var name: String?
    @NSManaged public var parentCat: Cat?

}
