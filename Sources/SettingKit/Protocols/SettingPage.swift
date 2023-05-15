//
//  SettingPage.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import UIKit


public protocol SettingPage {
    
    associatedtype ViewModelType: SettingPresentable
    
    var title: String? { get }
    var viewModel: ViewModelType { get }
    var viewController: UIViewController { get }
    
}
