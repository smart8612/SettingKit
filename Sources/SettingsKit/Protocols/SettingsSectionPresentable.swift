//
//  SettingsSectionPresentable.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import Foundation


/// A type that declares a setting section.
///
/// You can declares a setting section that can be shown at the settings collection
/// view.
public protocol SettingsSectionPresentable: Hashable {
    
    /// The title of the settings section.
    ///
    /// The title is shown at the collection view's header supplementary cell.
    var title: String? { get }
    
    /// The description of the settings section.
    ///
    /// The description is shown at the collection view's footer supplementary cell.
    var description: String? { get }
    
}
