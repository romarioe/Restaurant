//
//  MenuItem.swift
//  Restaurant
//
//  Created by Roman Efimov on 19/02/2019.
//  Copyright © 2019 Roman Efimov. All rights reserved.
//

import Foundation

struct MenuItems: Codable{
    var items: [MenuItem]
}

struct MenuItem: Codable, Equatable{
    var name: String
    var id: Int
    var price: Double
    var category: String
    var imageURL: String
    var detailText: String
    
    enum CodingKeys: String, CodingKey{
        case name
        case id
        case price
        case category
        case imageURL = "image_url"
        case detailText = "description"
    }
    
    static func == (lhs: MenuItem, rhs: MenuItem) -> Bool{
        return lhs.id == rhs.id
    }
}

extension MenuItem: Hashable{
    
}


