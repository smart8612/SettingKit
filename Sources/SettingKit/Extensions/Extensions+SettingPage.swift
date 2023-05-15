//
//  Extensions+SettingPage.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import UIKit


public extension SettingPage {
    
    var viewControllerEmbeddedInNavigationController: UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.title = title
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }
    
}
