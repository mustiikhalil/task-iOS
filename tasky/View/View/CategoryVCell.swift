//
//  CategoryVCell.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/30/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import UIKit

class CategoryVCell: UITableViewCell {

    @IBOutlet weak var labelText: UILabel!
    
    func configure(with data: Cat){
        labelText.text = data.type
    }
}
