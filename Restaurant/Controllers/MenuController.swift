//
//  MenuController.swift
//  Restaurant
//
//  Created by Roman Efimov on 19/02/2019.
//  Copyright © 2019 Roman Efimov. All rights reserved.
//

import Foundation
import UIKit

class MenuController{

    // MARK: -... Properties
    let baseURL = URL(string: "http://api.armenu.net:8090/")!
    
    static let shared = MenuController()
    
    private init(){}
    
    
    static let orderUpdateNotification = Notification.Name("MenuController.orderUpdated")
    
    var order = Order()
    
    
    var orderForSubmit = OrderForSubmit(){
        didSet{
            NotificationCenter.default.post(name: MenuController.orderUpdateNotification, object: nil)
        }
    }
    
    //MARK -... Methods
    func fetchCategories(completion: @escaping ([String]?) -> Void){
       let categoryURL = baseURL.appendingPathComponent("categories")
    
        let task = URLSession.shared.dataTask(with: categoryURL) { (data, _, _) in
            guard let data = data else{
                completion(nil)
                return
            }
            
            let jsonDecoder = JSONDecoder()
            let categories = try? jsonDecoder.decode(Categories.self, from: data)
            completion(categories?.categories)
        }
        task.resume()
    }
    
    
    func fetchImage(url: URL?, comoletion: @escaping (UIImage?) -> Void){
        guard let url = url else {
            comoletion(nil)
            return
            
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                comoletion(nil)
                return
                
            }
            
            
            guard let image = UIImage(data: data) else {return}
            comoletion(image)
            
            }.resume()
        
        
        
    }
    
    
    func fetchMenuItems(forCategory categoryName: String, completion: @escaping ([MenuItem]?) -> Void){
       let initialMenuURL = baseURL.appendingPathComponent("menu")
        
       var components = URLComponents(url: initialMenuURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [
        URLQueryItem(name: "category", value: categoryName)]
        guard let menuURL = components.url else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: menuURL) { (data, _, _) in
            guard let data = data else {
                completion(nil)
                return
            }
            let jsonDecoder = JSONDecoder()
            
            let menuItems = try? jsonDecoder.decode(MenuItems.self, from: data)
            completion(menuItems?.items)
            
        }
        task.resume()
        
    }
    

    
    func submitOrder(forMenuIDs menuIds: [Int], completion: @escaping (Int?) -> Void){
      let orderURL = baseURL.appendingPathComponent("order")
       
        var request = URLRequest(url: orderURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let data = ["menuIds": menuIds]
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(data)
        
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { (data, _, _) in
            guard let data = data else {
                completion(nil)
                return
            }
            let jsonDecoder = JSONDecoder()
            let preparationTime = try? jsonDecoder.decode(PreparationTime.self, from: data)
            
            completion(preparationTime?.prepTime)
        }
        task.resume()
    }
}
