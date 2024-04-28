//
//  AppDelegate.swift
//  Task21
//
//  Created by ana namgaladze on 24.04.24.
//

import UIKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground

        if UserDefaults.standard.bool(forKey: "isFirstLogin") == false {
            let vc  = LogInViewController()
            let navigationController = UINavigationController(rootViewController: vc)
            window?.rootViewController = navigationController
        } else {
            let vc = CountriesViewController()
            let navigationController = UINavigationController(rootViewController: vc)
            window?.rootViewController = navigationController
        }
        
        

        
        return true
    }
    
}




