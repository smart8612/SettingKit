//
//  SettingsCollectionViewControllerDelegate.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import Foundation


public protocol SettingsCollectionViewControllerDelegate: AnyObject {
    
    func provideSettingPage(of item: any SettingsItemPresentable, presentAction: ((any SettingsPage)?) -> Void)
    
    func action(for item: any SettingsItemPresentable)
    
}
