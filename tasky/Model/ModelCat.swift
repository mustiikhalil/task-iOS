//
//  ModelCat.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/29/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import Foundation


enum Important: Int{
    case high = 3
    case med = 2
    case low = 1
}

struct ModelCat {
    var name: String
    var importance: Important
}

extension ModelCat{
    init(newName: String, important: Important = .low) {
        name = newName
        importance = important
    }
}
