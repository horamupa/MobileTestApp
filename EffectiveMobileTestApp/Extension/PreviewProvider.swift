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
        .profile,.dialog,.cart,.heart,.home
    ]
    let dataManager = DataService()
    var coordinator = Coordinator(dataManager: DataService(), authManager: AuthService())
    
    let latestModel = LatestModel(category: "Phones", name: "Samsung S10", price: 1000, imageURL: "https://www.dhresource.com/0x0/f2/albu/g8/M01/9D/19/rBVaV1079WeAEW-AAARn9m_Dmh0487.jpg")
    let latestModels: [LatestModel] = [
        .init(category: "Phones", name: "Samsung S10", price: 1000, imageURL: "https://www.dhresource.com/0x0/f2/albu/g8/M01/9D/19/rBVaV1079WeAEW-AAARn9m_Dmh0487.jpg"),
        .init(category: "Games", name: "Sony Playstation 5", price: 700, imageURL: "https://avatars.mds.yandex.net/get-mpic/6251774/img_id4273297770790914968.jpeg/orig"),
        .init(category: "Games", name: "Xbox ONE", price: 500, imageURL: "https://www.tradeinn.com/f/13754/137546834/microsoft-xbox-xbox-one-s-1tb-console-additional-controller.jpg"),
        .init(category: "Cars", name: "BMW X6M", price: 35000, imageURL: "https://mirbmw.ru/wp-content/uploads/2022/01/manhart-mhx6-700-01.jpg")
    ]
    
    let flashSaleModel = FlashSaleModel(category: "Kids", name: "New Balance Sneakers", price: 22.5, discount: 30, imageURL: "https://newbalance.ru/upload/iblock/697/iz997hht_nb_02_i.jpg")
    
    let flashSalesModels: [FlashSaleModel] = [
        .init(category: "Kids", name: "New Balance Sneakers", price: 22.5, discount: 30, imageURL: "https://newbalance.ru/upload/iblock/697/iz997hht_nb_02_i.jpg"),
        .init(category: "Kids", name: "Reebok Classic", price: 24, discount: 30, imageURL: "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/3613ebaf6ed24a609818ac63000250a3_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_01_standard.jpg")
        ]
    
    @State var isTabBar:Bool = false
//    static var shop: ShopModel = ShopModel(id: 820, lat: 13.9650239, lng: 100.7475704, city: "Bangkok", name: "BloomCoffeShop", website: "https://www.facebook.com/Labtreeog/", description: "The most Perfect CoffeShop you ever seen. You can boy flowers, dubs, preroll and all kind equipment needed for smoking. Visit us whatever you will be nearby", titleimages: "Bloom1", imageurl: ["Bloom1","Bloom2","Bloom3"], rating: 4, reviews: 24, address: "Somewere in Thailand", badges: nil)
    
}
