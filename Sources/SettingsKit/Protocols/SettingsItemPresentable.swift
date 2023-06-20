//
//  SettingsItemPresentable.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import Foundation


public protocol SettingsItemPresentable: Hashable {
    
    associatedtype Section: SettingsSectionPresentable
    
    var title: String { get }
    var description: String? { get }
    var section: Section { get }
    
    var isGroup: Bool { get }
    var isChecked: Bool { get }
    
}
