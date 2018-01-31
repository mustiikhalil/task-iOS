//
//  Constants.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/30/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import Foundation
import RealmSwift

let realm = try! Realm()

class Databasing: Database_Protocol {
    
    func save(to writtenToDatabase: Object) {
        do {
            try realm.write {
                realm.add(writtenToDatabase)
            }
        } catch {
            print("error")
        }
    }
    
    func saveByAppend(to writtenToDatabase: Object,type: Object){
        
        if let category = type as? CategoryOfItem {
            do {
                try realm.write {
                    category.items.append(writtenToDatabase as! Item)
                }
                
            } catch {
                print("error")
            }
        }
        
    }
    
    func delete(to deleteFromDatabase: Object) {
        do {
            try realm.write {
                realm.delete(deleteFromDatabase)
            }
        } catch {
            print("error deleting")
        }
    }
    
    func deleteAll() {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    

}

let database = Databasing()
