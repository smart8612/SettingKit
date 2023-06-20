//
//  SettingsPresentable.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import Foundation


public protocol SettingsPresentable {
    
    associatedtype Section: SettingsSectionPresentable
    associatedtype Item: SettingsItemPresentable
    
    var items: [Item] { get }
    
}
