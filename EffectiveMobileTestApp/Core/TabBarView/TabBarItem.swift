//
//  TabBarItem.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

//struct TabBarItem: Hashable {
//    
//    let image: String
//    let title: String?
//    let color: Color?
//    
//    init(image: String, title: String? = nil, color: Color? = nil) {
//        self.image = image
//        self.title = title
//        self.color = color
//    }
//}

enum TabBarItem: Hashable {
    case home, heart, cart, dialog, profile
    
    var image: String {
        switch self {
        case .home:
            return "HomeLogo"
        case .heart:
            return "HeartLogo"
        case .cart:
            return "CartLogo"
        case .dialog:
            return "DialogLogo"
        case .profile:
            return "ProfileLogo"
        }
    }
}
 
