//
//  ItemVCell.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/30/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import UIKit

class ItemVCell: UITableViewCell {

    @IBOutlet weak var labelForItem: UILabel!

    func configure(with data: ModelItem){
        labelForItem.text = data.name
    }
}
