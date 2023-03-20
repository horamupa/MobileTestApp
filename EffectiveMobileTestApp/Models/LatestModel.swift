//
//  LatestModel.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 17.03.2023.
//

import SwiftUI

struct LatestModel: Codable {
    let category, name: String
    let price: Int
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case category, name, price
        case imageURL = "image_url"
    }
}
