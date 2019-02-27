//
//  OrderTableViewController.swift
//  Restaurant
//
//  Created by Roman Efimov on 25/02/2019.
//  Copyright © 2019 Roman Efimov. All rights reserved.
//

import UIKit

class OrderTableViewController: UITableViewController {
    
    var orderMinutes = 0
    var filtredMenuItems: [MenuItem] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //filtredMenuItems = menuItemsFiltred(originalMenuItems: MenuController.shared.order.menuItems)
        NotificationCenter.default.addObserver(tableView, selector: #selector(UITableView.reloadData), name: MenuController.orderUpdateNotification, object: nil)
    }
    
    
    func menuItemsFiltred(originalMenuItems: [MenuItem]) -> [MenuItem] {
        
        var filtredMenuItems: [MenuItem] = []
        
        for item in originalMenuItems{
            
            if filtredMenuItems.contains(item) == false {
                filtredMenuItems.append(item)
            }
        }
     return filtredMenuItems
    }
    
    func uploadOrder(){
        
        let menuIds = MenuController.shared.orderForSubmit.menuItems.map{ $0.id}
     
        
       MenuController.shared.submitOrder(forMenuIDs: menuIds) { minutes in
            guard let minutes = minutes else {return}
            self.orderMinutes = minutes
            
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "ConfirmSegue", sender: nil)
            }
        } 
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ConfirmSegue" else {return}
        let controller = segue.destination as! OrderConfirmViewController
        controller.time = orderMinutes
    }
    
    @IBAction func submitTapped(_ sender: Any) {
      
        let menuItems = MenuController.shared.orderForSubmit.menuItems
        let orderCount = menuItems.count
        let orderTotal = menuItems.reduce(0) {$0 + $1.price}
        let formattedOrder = String(format: "$%.2f", orderTotal)
        
        let alert = UIAlertController(title: "Confirm order", message: "Your total is \(orderCount) item(s) for \(formattedOrder)", preferredStyle: .alert)
       
        alert.addAction(UIAlertAction(title: "Submit", style: .default,   handler: {_ in self.uploadOrder() } ))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue){
        guard segue.identifier == "DismissConfirm" else {return}
        MenuController.shared.order.menuItems.removeAll()
        MenuController.shared.orderForSubmit.menuItems.removeAll()
    }
 
}
