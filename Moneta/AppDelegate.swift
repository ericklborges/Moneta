//
//  AppDelegate.swift
//  Moneta
//
//  Created by Erick Lozano Borges on 07/03/19.
//  Copyright © 2019 Erick Lozano Borges. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc = SummaryViewController()
        let navigationController = UINavigationController()
        navigationController.viewControllers = [vc]
        
        window.rootViewController = navigationController
        self.window = window
        
        window.makeKeyAndVisible()
        return true
    }
}

