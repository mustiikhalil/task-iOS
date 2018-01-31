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

func save(to writtenToDatabase: Object){
    do {
        try realm.write {
            realm.add(writtenToDatabase)
        }
    } catch {
        print("error")
    }
}

