//
//  OrderConfirmViewController.swift
//  Restaurant
//
//  Created by Roman Efimov on 25/02/2019.
//  Copyright © 2019 Roman Efimov. All rights reserved.
//

import UIKit

class OrderConfirmViewController: UIViewController {

    @IBOutlet weak var remiendTimeLabel: UILabel!
    
    var time = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated:true);
        remiendTimeLabel.text = "Thank you for your order.  You wait time is \(time) minutes"
      
    }
    


}
