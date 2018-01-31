////
////  CategoryVM.swift
////  tasky
////
////  Created by Mustafa Khalil on 1/30/18.
////  Copyright © 2018 Mustafa Khalil. All rights reserved.
////
//
import RealmSwift

class CategoryVM {
    
    // MARK - declared variables
    
    var array: Results<CategoryOfItem>!
    
    // MARK - adding into the DB
    
    func add(newItem: String){
        let item = CategoryOfItem()
        item.type = newItem
        database.save(to: item)
    }

    // MARK - get from the DB
    
    func fetch(){
        array = realm.objects(CategoryOfItem.self)
    }

    // MARK - remove from DB
    
    func remove(at index: Int){
       
    }

    // MARK - Search in DB
    
    func Search(text: String = ""){
       
    }
    
    func getElement(at index: Int) -> CategoryOfItem?{
        print(array?[index])
        return array?[index]
    }

}

