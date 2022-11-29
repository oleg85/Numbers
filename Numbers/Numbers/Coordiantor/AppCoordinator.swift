//
//  AppCoordinator.swift
//  Numbers
//
//  Created by Oleg Arzutov on 29/11/2022.
//

import Foundation
import UIKit
final class AppCoordinator: Coordinator{
    
    
    
    private let window: UIWindow
    private let navigationController: UINavigationController
   
    
    init(window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
    }
    
    func start() {
      
        let viewController = UIViewControllerFactory.make(for: .main)
        navigationController.viewControllers = [viewController]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
   
}
