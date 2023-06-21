//
//  SettingsItemPresentable.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import Foundation


/// A type that declares a setting item.
///
/// You can declares a setting item that can be shown at the settings collection
/// view.
public protocol SettingsItemPresentable: Hashable {
    
    /// An associated type that settings section type must confrom.
    associatedtype Section: SettingsSectionPresentable
    
    /// The title of the setting item.
    var title: String { get }
    
    /// The description of the setting item.
    var description: String? { get }
    
    /// the section of the setting item.
    var section: Section { get }
    
    /// A Boolean value that determines whether the item is group type.
    var isGroup: Bool { get }
    
    /// A Boolean value that determines whether the item is checked type.
    var isChecked: Bool { get }
    
}
