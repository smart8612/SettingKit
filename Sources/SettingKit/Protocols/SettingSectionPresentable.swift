//
//  SettingSectionPresentable.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import Foundation


public protocol SettingSectionPresentable: Hashable {
    
    var title: String? { get }
    var description: String? { get }
    
}
