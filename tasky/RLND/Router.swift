//
//  Router.swift
//  tasky
//
//  Created by Mustafa Khalil on 1/29/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import Foundation
import UIKit

struct Path {
    var id: String
    var type: String
}


class Routing: Router {

    
    var root: UIViewController = TableVC()
    
    func push(id: Path, nav: UIViewController) {
        let view = UIStoryboard(name: "Main", bundle: nil)
        nav.navigationController?.pushViewController(view.instantiateViewController(withIdentifier: "\(id.id)_\(id.type)") as! TableVC, animated: true)
    }
    
    func back(id: Path, nav: UIViewController){
        
    }
    
}
