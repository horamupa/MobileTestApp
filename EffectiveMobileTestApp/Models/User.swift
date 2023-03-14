//
//  Credentials.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

struct User: Equatable, Codable {
    var user: String = ""
    var password: String = ""
    
    static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.user == rhs.user && lhs.password == rhs.password
    }
}
