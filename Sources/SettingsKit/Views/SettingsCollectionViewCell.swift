//
//  SettingsCollectionViewCell.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import UIKit


final class SettingsCollectionViewCell<Item: SettingsItemPresentable>: UICollectionViewListCell {
    
    var item: Item? {
        didSet {
            if item != oldValue {
                setNeedsUpdateConfiguration()
            }
        }
    }
    
    func updateUI(with item: Item) {
        self.item = item
    }
    
    override func updateConfiguration(using state: UICellConfigurationState) {
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
