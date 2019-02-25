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
        cell.textLabel?.text = MenuController.shared.order.menuItems[indexPath.row].name
        cell.detailTextLabel?.text = String(format: "$%.2f", MenuController.shared.order.menuItems[indexPath.row].price)
    }
}
