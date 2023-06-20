//
//  SettingCollectionViewControllerDelegate.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import Foundation


public protocol SettingCollectionViewControllerDelegate: AnyObject {
    
    func provideSettingPage(of item: any SettingItemPresentable, presentAction: ((any SettingPage)?) -> Void)
    
    func action(for item: any SettingItemPresentable)
    
}
