//
//  AppearanceSettingsViewModel.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import Foundation


public final class AppearanceSettingsViewModel: SettingPresentable {
    
    private var appearanceSettingController = AppearanceSettingController()
    
    public var items: [Item] {
        [
            Item(
                title: "System Default",
                section: .theme,
                isGroup: false,
                isChecked: appearanceSettingController.isUnspecifiedColorSchema
            ),
            Item(
                title: "Light Mode",
                section: .theme,
                isGroup: false,
                isChecked: appearanceSettingController.isLightColorSchema
            ),
            Item(
                title: "Dark Mode",
                section: .theme,
                isGroup: false,
                isChecked: appearanceSettingController.isDarkColorSchema
            ),
        ]
    }
    
    public enum Section: SettingSectionPresentable {
        case theme
        
        public var title: String? {
            switch self {
            case .theme:
                return "Theme"
            }
        }
        
        public var description: String? {
            switch self {
            case .theme:
                return "Configure app's color theme schema."
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

extension AppearanceSettingsViewModel: SettingCollectionViewControllerDelegate {
    
    public func provideSettingPage(of item: any SettingItemPresentable, presentAction: ((any SettingPage)?) -> Void) {
        presentAction(nil)
    }
    
    public func action(for item: any SettingItemPresentable) {
        guard let item = item as? AppearanceSettingsViewModel.Item else { return }
        let items = items
        
        if item == items[0] {
            appearanceSettingController.changeColorSchema(to: .unspecified)
        } else if item == items[1] {
            appearanceSettingController.changeColorSchema(to: .light)
        } else if item == items[2] {
            appearanceSettingController.changeColorSchema(to: .dark)
        }
    }
    
}
