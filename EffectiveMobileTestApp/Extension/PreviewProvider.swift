//
//  PreviewProvider.swift
//  CryptoApp
//
//  Created by MM on 21.10.2022.
//

import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    
    private init() {  }
    
    let tabs: [TabBarItem] = [
        TabBarItem(image: "HomeLogo"),
        TabBarItem(image: "HeartLogo"),
        TabBarItem(image: "CartLogo"),
        TabBarItem(image: "DialogLogo"),
        TabBarItem(image: "ProfileLogo")
    ]
    
    @State var isTabBar:Bool = false
//    static var shop: ShopModel = ShopModel(id: 820, lat: 13.9650239, lng: 100.7475704, city: "Bangkok", name: "BloomCoffeShop", website: "https://www.facebook.com/Labtreeog/", description: "The most Perfect CoffeShop you ever seen. You can boy flowers, dubs, preroll and all kind equipment needed for smoking. Visit us whatever you will be nearby", titleimages: "Bloom1", imageurl: ["Bloom1","Bloom2","Bloom3"], rating: 4, reviews: 24, address: "Somewere in Thailand", badges: nil)
    
}
