//
//  Extensions+SettingsPage.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import UIKit


public extension SettingsPage {
    
    /// A view controller instance that represents the setting collection
    /// view controller.
    ///
    /// A view controller use the view model which is declared
    /// on the settings page.
    /// If view model conforms ``SettingsCollectionViewControllerDelegate``
    /// then set view controller's delegate object to view model.
    var viewController: UIViewController {
        let viewController = SettingsCollectionViewController(viewModel: viewModel)
        viewController.settingDelegate = viewModel as? any SettingsCollectionViewControllerDelegate
        viewController.title = title
        return viewController
    }
    
    var viewControllerEmbeddedInNavigationController: UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.title = title
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }
    
}
