//
//  OrderTableViewController+DataSource.swift
//  Restaurant
//
//  Created by Roman Efimov on 25/02/2019.
//  Copyright © 2019 Roman Efimov. All rights reserved.
//

import UIKit

extension OrderTableViewController /*: UITableViewDataSource */ {
    

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuController.shared.order.menuItems.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell")!
        configureCell(cell, forItemAt: indexPath)
        return cell
    }
    
    
    func configureCell(_ cell: UITableViewCell, forItemAt indexPath: IndexPath ){
        var listMenuItem: [MenuItem] = []
        var countMenuItem: [Int] = []
        
        for (list, count) in MenuController.shared.order.menuItems {
            listMenuItem.append(list)
            countMenuItem.append(count)
        }
        cell.textLabel?.text = String(countMenuItem[indexPath.row]) + " x " + listMenuItem[indexPath.row].name
        cell.detailTextLabel?.text = String(format: "$%.2f", listMenuItem[indexPath.row].price * Double(countMenuItem[indexPath.row]) )
    }
}
