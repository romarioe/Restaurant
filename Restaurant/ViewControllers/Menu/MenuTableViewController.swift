//
//  MenuTableViewController.swift
//  Restaurant
//
//  Created by Roman Efimov on 19/02/2019.
//  Copyright © 2019 Roman Efimov. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    var menu = [MenuItem]()
    var category: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        MenuController.shared.fetchMenuItems(forCategory: category) { (menu) in
            guard let menu = menu else{return}
            self.UpdateUI(with: menu)
        }
        
    }

    func UpdateUI(with menu: [MenuItem]){
        DispatchQueue.main.async {
            self.menu = menu
            self.tableView.reloadData()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "DetailSegue" else {return}
        let controller = segue.destination as! MenuItemDetailViewController
        let index = tableView.indexPathForSelectedRow!.row
        controller.item = menu[index]
    }
 
}
