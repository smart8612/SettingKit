//
//  SettingPresentable.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import Foundation

protocol SettingPresentable {
    
    associatedtype Section: SettingSectionPresentable
    associatedtype Item: SettingItemPresentable
    
    var items: [Item] { get }
    
}
