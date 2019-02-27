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
        
        let url = formatUrl(string: item.imageURL)
        
        MenuController.shared.fetchImage(url: url) { (image) in
            guard let image = image else {return}
            
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
        
        setupUI()
        updateUI()

    }
    
    func formatUrl (string: String) -> URL{
        let formatedUrl = "http://api.armenu.net:8090/" + string.dropFirst(22)
        return (URL(string: formatedUrl)!)
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
        
        if MenuController.shared.order.menuItems.isEmpty {
            MenuController.shared.order.menuItems.updateValue(1, forKey: item)
        } else {
            
            for (menuItemName, menuItemCount) in MenuController.shared.order.menuItems {
                
                if item == menuItemName{
                    MenuController.shared.order.menuItems.updateValue(menuItemCount+1, forKey: menuItemName)
                } else {
                    MenuController.shared.order.menuItems.updateValue(1, forKey: item)
                }
            }
        }
        
        MenuController.shared.orderForSubmit.menuItems.append(item)

      
    }

}
