//
//  CategoryTableViewController.swift
//  Restaurant
//
//  Created by Roman Efimov on 19/02/2019.
//  Copyright © 2019 Roman Efimov. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        MenuController.shared.fetchCategories { categories in
            print(categories ?? "nil")
        }
        
        MenuController.shared.fetchMenuItems(forCategory: "entrees") { menuItems in
        menuItems?.forEach{ print("\t\($0)")}
            
        }
        
        
        MenuController.shared.submitOrder(forMenuIDs: [2, 3]) {time in
            print ("time = ", time ?? "nil")
        }
    }

    
    
}
