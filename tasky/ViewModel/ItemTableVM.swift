//
//  TableVM.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/29/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import Foundation
import CoreData

enum Important: Int16{
    case high = 3
    case med = 2
    case low = 1
}


struct ItemTableVM {
    
    var array: [ModelItem] = []
    var count: Int { get {return array.count }}
    
    mutating func add(newItem: String){
        let item = ModelItem(context: context)
        item.name = newItem
        item.didCheck = false
        item.importance = 2
        
        array.append(item)
        save()
    }
    
    mutating func fetch(with request: NSFetchRequest<ModelItem> = ModelItem.fetchRequest()){
        do{
            array = try context.fetch(request)
        } catch {
            print("error fetching")
        }
    }
    
    mutating func remove(at index: Int){
        context.delete(array[index])
        array.remove(at: index)
        save()
    }
    
    mutating func didChange(at index: Int){
        array[index].didCheck = !array[index].didCheck
        save()
    }
    
    mutating func Search(text: String = ""){
        let request: NSFetchRequest<ModelItem> = ModelItem.fetchRequest()
        let predicate = NSPredicate(format: "name CONTAINS %@", text)
        
        request.predicate = predicate
        
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]

        fetch(with: request)
    }
    
}


extension ItemTableVM {
    init(newArray: [ModelItem] ) {
        array = newArray
    }
}


