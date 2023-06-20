//
//  SettingsPage.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import UIKit


public protocol SettingsPage {
    
    associatedtype ViewModelType: SettingsPresentable
    
    var title: String? { get }
    var viewModel: ViewModelType { get }
    var viewController: UIViewController { get }
    
}
