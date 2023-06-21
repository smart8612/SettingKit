//
//  SettingsPresentable.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import Foundation


/// A type that can declares the setting options.
public protocol SettingsPresentable {
    
    /// An associated type that the section type must conform.
    associatedtype Section: SettingsSectionPresentable
    
    /// An associated type that the item type must conform.
    associatedtype Item: SettingsItemPresentable
    
    /// The list of the setting item.
    ///
    /// You can declare setting options on ``items`` property.
    var items: [Item] { get }
    
}
