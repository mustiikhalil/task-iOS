//
//  DBM.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/30/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import Foundation


func save(){
    do {
        try context.save()
    } catch {
        print("error")
    }
}
