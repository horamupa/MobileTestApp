//
//  LatestModel.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 17.03.2023.
//

// API Model
/*
 {
 "latest": [
     {
         "category": "Phones",
         "name": "Samsung S10",
         "price": 1000,
         "image_url": "https://www.dhresource.com/0x0/f2/albu/g8/M01/9D/19/rBVaV1079WeAEW-AAARn9m_Dmh0487.jpg"
     },
     {
         "category": "Games",
         "name": "Sony Playstation 5",
         "price": 700,
         "image_url": "https://avatars.mds.yandex.net/get-mpic/6251774/img_id4273297770790914968.jpeg/orig"
     },
     {
         "category": "Games",
         "name": "Xbox ONE",
         "price": 500,
         "image_url": "https://www.tradeinn.com/f/13754/137546834/microsoft-xbox-xbox-one-s-1tb-console-additional-controller.jpg"
     },
     {
         "category": "Cars",
         "name": "BMW X6M",
         "price": 35000,
         "image_url": "https://mirbmw.ru/wp-content/uploads/2022/01/manhart-mhx6-700-01.jpg"
     }
 ]
 }
 */

import SwiftUI

struct LatestJSON: Codable {
    let latest: [LatestModel]
}

struct LatestModel: Codable, Identifiable {
    let id = UUID().uuidString
    let category, name: String
    let price: Int
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case category, name, price
        case imageURL = "image_url"
    }
}
