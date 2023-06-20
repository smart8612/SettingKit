//
//  SettingCollectionViewCell.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import UIKit


public final class SettingCollectionViewCell<Item: SettingsItemPresentable>: UICollectionViewListCell {
    
    var item: Item? {
        didSet {
            if item != oldValue {
                setNeedsUpdateConfiguration()
            }
        }
    }
    
    public func updateUI(with item: Item) {
        self.item = item
    }
    
    public override func updateConfiguration(using state: UICellConfigurationState) {
        var contentConfigure = defaultContentConfiguration()
        contentConfigure.text = item?.title
        contentConfiguration = contentConfigure
        
        var cellAccessories: [UICellAccessory] = []
        
        if item?.isGroup == true {
            cellAccessories.append(.disclosureIndicator())
        }
        
        if item?.isChecked == true {
            cellAccessories.append(.checkmark())
        }
        
        if let supplementaryTitle = item?.description {
            cellAccessories.append(.label(text: supplementaryTitle))
        }
        
        accessories = cellAccessories
    }
    
}
