//
//  CategoryTableViewController+DataSource.swift
//  Restaurant
//
//  Created by Roman Efimov on 23/02/2019.
//  Copyright © 2019 Roman Efimov. All rights reserved.
//
import UIKit

extension CategoryTableViewController /*: UITableViewDataSoutce */{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell")!
        configureCell(cell, forItemAt: indexPath)
        return cell
    }
    
    func configureCell(_ cell: UITableViewCell, forItemAt indexPath: IndexPath){
        let category = categories[indexPath.row]
        cell.textLabel?.text = category.capitalized
    }
    
}
