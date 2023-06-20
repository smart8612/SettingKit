//
//  AboutSettingsViewModel.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import Foundation


public final class AboutSettingsViewModel: SettingsPresentable {
    
    public var items: [Item] {
        [
            Item(
                title: "🐶 Developer Name",
                description: "JeongTaek Han",
                section: .general,
                isGroup: false,
                isChecked: false
            ),
            Item(
                title: "💻 Github",
                description: "@smart8612",
                section: .general,
                isGroup: false,
                isChecked: false
            )
        ]
    }
    
    public enum Section: SettingsSectionPresentable {
        case general
        
        public var title: String? {
            switch self {
            case .general:
                return "Copyright"
            }
        }
        
        public var description: String? { nil }
    }
    
    public struct Item: SettingsItemPresentable {
        
        public var title: String
        public var description: String?
        public var section: Section
        public var isGroup: Bool
        public var isChecked: Bool
        
    }
    
}

