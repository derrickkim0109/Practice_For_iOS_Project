//
//  AppCoordinator.swift
//  Sample_MVVM_RxSwift
//
//  Created by Derrick kim on 2022/08/13.
//

import UIKit

class AppCoordinator {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window 
    }
    
    func start() {
        let viewController = ViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
