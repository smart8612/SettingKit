//
//  AboutSettingPage.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import Foundation


public struct AboutSettingPage: SettingPage {
    
    public var title: String? { "About" }
    
    public let viewModel = AboutSettingsViewModel()
    
    public init() {}
    
}
