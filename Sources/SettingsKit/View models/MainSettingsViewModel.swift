//
//  MainSettingsViewModel.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import Foundation


public final class MainSettingsViewModel: SettingsPresentable {
    
    private var appearanceSettingController = AppearanceSettingController()
    
    public var items: [Item] {
        [
            Item(
                title: "Themes",
                description: appearanceSettingController.currentColorSchemaDescription,
                section: .general,
                isGroup: true,
                isChecked: false
            ),
            Item(
                title: "About",
                section: .general,
                isGroup: true,
                isChecked: false
            )
        ]
    }
    
    public enum Section: SettingsSectionPresentable {
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
    
    public struct Item: SettingsItemPresentable {
        
        public var title: String
        public var description: String?
        public var section: Section
        public var isGroup: Bool
        public var isChecked: Bool
        
    }
    
}

extension MainSettingsViewModel: SettingsCollectionViewControllerDelegate {
    
    public func provideSettingPage(of item: any SettingsItemPresentable, presentAction: ((any SettingsPage)?) -> Void) {
        guard let item = item as? Item else { return }
        let items = items
        
        if item == items[0] {
            presentAction(AppearanceSettingPage())
        } else if item == items[1] {
            presentAction(AboutSettingPage())
        }
    }
    
    public func action(for item: any SettingsItemPresentable) { }
    
}
