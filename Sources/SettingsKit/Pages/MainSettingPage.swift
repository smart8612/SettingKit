//
//  MainSettingPage.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import UIKit


public struct MainSettingPage: SettingsPage {
    
    public var title: String? { "Setting" }
    
    public let viewModel = MainSettingsViewModel()
    
    public init() {}
    
}
