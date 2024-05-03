//
//  AppDelegate.swift
//  Task23
//
//  Created by ana namgaladze on 02.05.24.
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
        let viewModel = FactsViewModel()
        let vc = FactsViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: vc)
        window?.rootViewController = navigationController
        
        return true
    }
    
}
