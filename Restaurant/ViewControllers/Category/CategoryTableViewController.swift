//
//  CategoryTableViewController.swift
//  Restaurant
//
//  Created by Roman Efimov on 19/02/2019.
//  Copyright © 2019 Roman Efimov. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    var categories = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        MenuController.shared.fetchCategories { categories in
            guard let categories = categories else {return}
            self.UpdateUI(with: categories)
        }  
    }

    
    func UpdateUI(with categories: [String]){
        DispatchQueue.main.async {
            self.categories = categories
            self.tableView.reloadData()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "MenuSegue" else {return}
        let controller = segue.destination as! MenuTableViewController
        let index = tableView.indexPathForSelectedRow!.row
        controller.category = categories[index]
        
    }
    
    
}
