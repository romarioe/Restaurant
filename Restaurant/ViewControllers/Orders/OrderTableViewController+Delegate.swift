//
//  OrderTableViewController+Delegate.swift
//  Restaurant
//
//  Created by Roman Efimov on 27/02/2019.
//  Copyright © 2019 Roman Efimov. All rights reserved.
//

import Foundation
import UIKit

extension OrderTableViewController{ /*: TableViewDelegate */

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle ==  .delete {
            
            var counter = 0
            var index: MenuItem
            var tempOrderForSubmit = OrderForSubmit()
            
            for name in MenuController.shared.order.menuItems{
                if counter == indexPath.row {
                    index = name.key
                    let indexToRemove =  MenuController.shared.order.menuItems.index(forKey: index)
                    MenuController.shared.order.menuItems.remove(at: indexToRemove!)
                    
                    for item in MenuController.shared.orderForSubmit.menuItems{
                        if item != index {
                            tempOrderForSubmit.menuItems.append(item)
                        }
                    }
                    
                    MenuController.shared.orderForSubmit.menuItems = tempOrderForSubmit.menuItems
                    break
                } else {
                    counter += 1
                }
            }
            
            tableView.reloadData()
        }
    }
}
