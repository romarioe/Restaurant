//
//  MenuItemDetailViewController.swift
//  Restaurant
//
//  Created by Roman Efimov on 19/02/2019.
//  Copyright © 2019 Roman Efimov. All rights reserved.
//

import UIKit

class MenuItemDetailViewController: UIViewController {
    
    var item: MenuItem!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var detailTextLabel: UILabel!
    @IBOutlet weak var addToOrderButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        updateUI()

    }
    
    func setupUI(){
        addToOrderButton.layer.cornerRadius = 5
    }
    
    
    func updateUI(){
        titleLabel.text = item.name
        priceLabel.text = String(format: "$%.2f", item.price)
        detailTextLabel.text = item.detailText
        
    }
    

    @IBAction func addToOrderButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3){
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 3, y: 3)
            self.addToOrderButton.transform = CGAffineTransform.identity
        }
        
        MenuController.shared.order.menuItems.append(item)
        
    }
    

    

    

}
