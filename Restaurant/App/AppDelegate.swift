//
//  AppDelegate.swift
//  Restaurant
//
//  Created by Roman Efimov on 19/02/2019.
//  Copyright © 2019 Roman Efimov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var orderTabBarItem: UITabBarItem!


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateBage), name: MenuController.orderUpdateNotification, object: nil)
        
        
        orderTabBarItem = (window!.rootViewController! as! UITabBarController).viewControllers![1].tabBarItem
        
        
        return true
    }
    
    
    @objc func updateBage(){
        let meals = MenuController.shared.order.menuItems.count
        
        if meals == 0 {
            orderTabBarItem.badgeValue = nil
        } else {
            orderTabBarItem.badgeValue = String(meals)
        }
    }




}

