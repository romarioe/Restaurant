//
//  MenuTableView+DataSource.swift
//  Restaurant
//
//  Created by Roman Efimov on 23/02/2019.
//  Copyright © 2019 Roman Efimov. All rights reserved.
//

import UIKit

extension MenuTableViewController /*: UITableViewDataSource */{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell")!
        configure(cell, forItemAt: indexPath)
        return cell
    }
    
    func configure(_ cell: UITableViewCell, forItemAt indexPath: IndexPath){
        let menuItem = menu[indexPath.row]
        cell.textLabel?.text = menuItem.name
        cell.detailTextLabel?.text = String(format: "$%.2f", menuItem.price)
    }
    
    
    
}
