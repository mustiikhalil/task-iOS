//
//  CategoryTVC.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/29/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import UIKit



class CategoryTVC: UITableViewCell {

    @IBOutlet weak var categoryType: UILabel!
    @IBOutlet weak var priority: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func ConfigureCell(at catCell: CatCell){
        categoryType.text = catCell.name
        priority.text = catCell.important
    }
}




