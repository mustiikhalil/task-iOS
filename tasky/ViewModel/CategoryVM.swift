////
////  CategoryVM.swift
////  tasky
////
////  Created by Mustafa Khalil on 1/30/18.
////  Copyright © 2018 Mustafa Khalil. All rights reserved.
////
//
//import Foundation
//
//
//import Foundation
//import CoreData
//
//struct CategoryVM {
//
//    //MARK - declared variables
//    var array: [Cat] = []
//    var count: Int { get {return array.count }}
//
//    //MARK - adding into the DB
//    mutating func add(newItem: String){
//        let item = Cat(context: context)
//        item.type = newItem
//        array.append(item)
//        save()
//    }
//
//    //MARK - get from the DB
//    mutating func fetch(with request: NSFetchRequest<Cat> = Cat.fetchRequest()){
//        do{
//            array = try context.fetch(request)
//
//        } catch {
//            print("error fetching")
//        }
//    }
//
//    //MARK - remove from DB
//    mutating func remove(at index: Int){
//        context.delete(array[index])
//        array.remove(at: index)
//        save()
//    }
//
//    //MARK - Search in DB
//    mutating func Search(text: String = ""){
//        let request: NSFetchRequest<Cat> = Cat.fetchRequest()
//        let predicate = NSPredicate(format: "name CONTAINS %@", text)
//
//        request.predicate = predicate
//
//        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
//
//        fetch(with: request)
//    }
//
//}
//
