//
//  MainSettingsViewModel.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import Foundation


public final class MainSettingsViewModel: SettingPresentable {
    
    private var appearanceSettingController = AppearanceSettingController()
    
    public var items: [Item] {
        [
            Item(
                title: "Themes",
                description: appearanceSettingController.currentColorSchemaDescription,
                section: .general,
                isGroup: true,
                isChecked: false
            )
        ]
    }
    
    public enum Section: SettingSectionPresentable {
        case general
        
        public var title: String? {
            switch self {
            case .general:
                return "General"
            }
        }
        
        public var description: String? {
            switch self {
            case .general:
                return "Configure app's general usage experiences."
            }
        }
    }
    
    public struct Item: SettingItemPresentable {
        
        public var title: String
        public var description: String?
        public var section: Section
        public var isGroup: Bool
        public var isChecked: Bool
        
    }
    
}

extension MainSettingsViewModel: SettingCollectionViewControllerDelegate {
    
    public func provideSettingPage(of item: any SettingItemPresentable, presentAction: ((any SettingPage)?) -> Void) {
        if item as! MainSettingsViewModel.Item == items[0] {
            presentAction(AppearanceSettingPage())
        }
    }
    
    public func action(for item: any SettingItemPresentable) { }
    
}
