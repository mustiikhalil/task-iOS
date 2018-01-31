//
//  TypeOfItems.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/30/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import UIKit

class TypeOfItems: UITableViewCell {

    @IBOutlet weak var textLbl: UILabel!
    
    func configure(item: CategoryOfItem?){
        textLbl.text = item?.type ?? "No Category Added"
    }
}
