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
}

extension TableVM{
    
    
    init(newArray: [CatCell] ) {
        array = newArray
    }
}

extension CatCell {
    init(model: ModelCat) {
        name = model.name
    }
}

struct TestCase {
    var array: [CatCell] = []
    init() {
        array.append(CatCell(model: ModelCat(newName: "sara", important: .high)))
        array.append(CatCell(model: ModelCat(newName: "mustafa", important: .high)))
    }
}

