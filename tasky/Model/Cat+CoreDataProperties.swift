//
//  Cat+CoreDataProperties.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/30/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//
//

import Foundation
import CoreData


extension Cat {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cat> {
        return NSFetchRequest<Cat>(entityName: "Cat")
    }

    @NSManaged public var type: String?
    @NSManaged public var items: NSSet?

}

// MARK: Generated accessors for items
extension Cat {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: ModelItem)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: ModelItem)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}
