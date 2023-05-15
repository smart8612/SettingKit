//
//  MainSettingsViewModel.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import Foundation


final class MainSettingsViewModel: SettingPresentable {
    
    private var appearanceSettingController = AppearanceSettingController()
    
    var items: [Item] {
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
    
    enum Section: SettingSectionPresentable {
        case general
        
        var title: String? {
            switch self {
            case .general:
                return "General"
            }
        }
        
        var description: String? {
            switch self {
            case .general:
                return "Configure app's general usage experiences."
            }
        }
    }
    
    struct Item: SettingItemPresentable {
        
        var title: String
        var description: String?
        var section: Section
        var isGroup: Bool
        var isChecked: Bool
        
    }
    
}

extension MainSettingsViewModel: SettingPresentableDelegate {
    
    func provideSettingViewController(of item: any SettingItemPresentable, presentAction: ((any SettingPage)?) -> Void) {
        if item as! MainSettingsViewModel.Item == items[0] {
            presentAction(AppearanceSettingPage())
        }
    }
    
    func action(for item: any SettingItemPresentable) { }
    
}
