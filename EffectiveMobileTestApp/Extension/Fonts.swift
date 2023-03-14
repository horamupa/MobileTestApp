//
//  Fonts.swift
//  SpaceXLaunch
//
//  Created by MM on 31.10.2022.
//

import SwiftUI

extension Font {

    enum MontserratFont {
        case semibold
        case regular
        case bold
        case black
        case custom(String)
        case medium
        case thin
        case light

        var value: String {
            switch self {
            case .semibold:
                return "Montserrat-SemiBold"
            case .regular:
                return "Montserrat-Regular"
            case .bold:
                return "Montserrat-Bold"
            case .black:
                return "Montserrat-Black"
            case .medium:
                return "Montserrat-Medium"
            case .thin:
                return "Montserrat-SemiBold"
            case .light:
                return "Montserrat-Light"
            case .custom(let name):
                return name
            }
        }
    }
    
    static func mantserrat(_ type: MontserratFont, size: CGFloat = 26) -> Font {
        return .custom(type.value, size: size)
    }
}

