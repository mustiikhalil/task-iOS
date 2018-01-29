//
//  TableVM.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/29/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import Foundation


struct TableVM {
    var array: [CatCell] = []
    
    init() {
        let test = TestCase()
        array = test.array
    }
}

struct CatCell {
    var name: String?
    var important: String?
    
    func getImportance(_ impor: Important) -> String{
        
        switch impor {
        case .high:
            return "!!!"
        case .med:
            return "!!"
        default:
            return "!"
        }
    }
}

extension TableVM{
    
    
    init(newArray: [CatCell] ) {
        array = newArray
    }
}

extension CatCell {
    init(model: ModelCat) {
        name = model.name
        important = getImportance(model.importance)
    }
}

struct TestCase {
    var array: [CatCell] = []
    init() {
        array.append(CatCell(model: ModelCat(newName: "Welcome", important: .high)))
        array.append(CatCell(model: ModelCat(newName: "To what i call", important: .low)))
        array.append(CatCell(model: ModelCat(newName: "P-VVM-RLND", important: .med)))
        array.append(CatCell(model: ModelCat(newName: "tooooo complicated i know!", important: .high)))
    }
}

