//
//  TabBarItem.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

struct TabBarItem: Hashable {
    
    let image: String
    let title: String?
    let color: Color?
    
    init(image: String, title: String? = nil, color: Color? = nil) {
        self.image = image
        self.title = title
        self.color = color
    }
}

//enum TabBarItem: Hashable {
//    
//}
