//
//  SettingsPage.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import UIKit


/// A type that declares a settings page.
public protocol SettingsPage {
    
    /// An associated type that view model have to conform.
    associatedtype ViewModelType: SettingsPresentable
    
    /// The title of the settings page which can be seen at the navigation bar.
    var title: String? { get }
    
    /// The view model of the settings page which can declare setting options.
    var viewModel: ViewModelType { get }
    
    /// The view controller of the settings page.
    var viewController: UIViewController { get }
    
}
