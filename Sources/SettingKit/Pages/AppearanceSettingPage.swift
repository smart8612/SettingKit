//
//  AppearanceSettingPage.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import UIKit


public struct AppearanceSettingPage: SettingPage {
    
    public var title: String? { "Appearance" }
    
    public let viewModel = AppearanceSettingsViewModel()
    
    public var viewController: UIViewController {
        let viewController = SettingsCollectionViewController(viewModel: viewModel)
        viewController.settingDelegate = viewModel
        viewController.title = title
        return viewController
    }
    
}
