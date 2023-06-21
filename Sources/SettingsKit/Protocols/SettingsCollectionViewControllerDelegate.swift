//
//  SettingsCollectionViewControllerDelegate.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import Foundation


/// The methods adopted by the object you use to manage user interactions with items in a settings collection view.
///
/// A settings collection view controller delegate manages user interactions with the setting items contents and performing actions on those items.
public protocol SettingsCollectionViewControllerDelegate: AnyObject {
    
    /// Provides the setting page to the settings collection view controller.
    /// - Parameters:
    ///   - item: The settings item which is chosen.
    ///   - presentAction: The closure that can be used to present the settings page.
    func provideSettingPage(of item: any SettingsItemPresentable, presentAction: ((any SettingsPage)?) -> Void)
    
    func action(for item: any SettingsItemPresentable)
    
}
