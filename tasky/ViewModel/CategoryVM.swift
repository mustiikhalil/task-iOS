////
////  CategoryVM.swift
////  tasky
////
////  Created by Mustafa Khalil on 1/30/18.
////  Copyright © 2018 Mustafa Khalil. All rights reserved.
////
//
import RealmSwift

struct CategoryVM {

    // MARK - declared variables
    
    var array: Results<CategoryOfItem>?
    
//    var count: Int { get { return array.count ?? 0 }}

    // MARK - adding into the DB
    mutating func add(newItem: String){
        let item = CategoryOfItem()
        item.type = newItem
        save(to: item)
    }

    // MARK - get from the DB
    mutating func fetch(){
        array = realm.objects(CategoryOfItem.self)
    }

    // MARK - remove from DB
    mutating func remove(at index: Int){
       
    }
    mutating func delete(){
        try! realm.write {
            realm.deleteAll()
        }
    }

    // MARK - Search in DB
    mutating func Search(text: String = ""){
       
    }
    
    func getElement(at index: Int) -> CategoryOfItem?{
        print(array?[index])
        return array?[index]
    }

}

