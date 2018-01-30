//
//  ItemVCell.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/30/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import UIKit

class ItemVCell: UITableViewCell {

    @IBOutlet weak var textLbl: UILabel!
    
    func configure(with data: ModelItem){
        textLbl.text = (data.name)!
    }
}
