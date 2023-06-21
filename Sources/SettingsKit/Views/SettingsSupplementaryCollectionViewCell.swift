//
//  SettingsSupplementaryCollectionViewCell.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import UIKit


final class SettingsSupplementaryCollectionViewCell<Section: SettingsSectionPresentable>: UICollectionViewListCell {
    
    var section: Section? {
        didSet {
            if section != oldValue {
                setNeedsUpdateConfiguration()
            }
        }
    }
    
    var kind: String = ""
    
    func updateUI(kind: String, with section: Section) {
        self.kind = kind
        self.section = section
    }
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        var contentConfig = defaultContentConfiguration()
        
        if kind == UICollectionView.elementKindSectionHeader {
            contentConfig.text = section?.title
        } else {
            contentConfig.text = section?.description
        }
        
        contentConfiguration = contentConfig
    }
    
}
