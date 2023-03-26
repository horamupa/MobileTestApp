//
//  Credentials.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

struct User: Equatable, Codable {
    var email: String = ""
    var name: String = ""
    var surname: String = ""
    var password: String = ""
    
    static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.email == rhs.email
    }
}
