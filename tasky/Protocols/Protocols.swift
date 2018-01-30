//
//  Protocols.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/29/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//
//

import UIKit

protocol ReusableView: class {}

protocol NibLoadableView: class { }


protocol Router {
    
    var root: UIViewController {get set}
    
    func push(id: Path, nav: UIViewController)
    func back(id: Path, nav: UIViewController)
}


protocol Network {}

protocol Database {}

protocol Binding {}
