//
//  Order.swift
//  Restaurant
//
//  Created by Roman Efimov on 19/02/2019.
//  Copyright © 2019 Roman Efimov. All rights reserved.
//

struct Order: Codable{
    var menuItems: [MenuItem: Int]
    
    init(menuItems: [MenuItem: Int] = [:]){
        self.menuItems = menuItems
    }
}


struct OrderForSubmit: Codable{
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []){
        self.menuItems = menuItems
    }
}


