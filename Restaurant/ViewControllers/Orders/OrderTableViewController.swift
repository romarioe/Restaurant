//
//  OrderTableViewController.swift
//  Restaurant
//
//  Created by Roman Efimov on 25/02/2019.
//  Copyright © 2019 Roman Efimov. All rights reserved.
//

import UIKit

class OrderTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(tableView, selector: #selector(UITableView.reloadData), name: MenuController.orderUpdateNotification, object: nil)
    }
    
    
    func uploadOrder(){
        
    }
    
    @IBAction func submitTapped(_ sender: Any) {
        
        let menuItems = MenuController.shared.order.menuItems
        let orderCount = menuItems.count
        let orderTotal = menuItems.reduce(0) {$0 + $1.price}
        let formattedOrder = String(format: "$%.2f", orderTotal)
        
        let alert = UIAlertController(title: "Confirm order", message: "Your total is \(orderCount) item(s) for \(formattedOrder)", preferredStyle: .alert)
       
        alert.addAction(UIAlertAction(title: "Submit", style: .default,   handler: {_ in self.uploadOrder() } ))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue){
        
    }
 
}
