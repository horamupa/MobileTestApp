//
//  View.swift
//  Trip Map
//
//  Created by MM on 27.02.2023.
//

import SwiftUI

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
    
//    func placeholder(
//        _ text: String,
//        when shouldShow: Bool,
//        alignment: Alignment = .center) -> some View {
//
//        placeholder(when: shouldShow, alignment: alignment) { Text(text).foregroundColor(.gray) }
//    }
    
    func authFieldView(_ text: String) -> some View {
        self
//            .placeholder(text, when: true)
            .placeholder(when: text.isEmpty) {
                Text("Placeholder recreated").foregroundColor(.gray)
            }
            .frame(height: 29)
            .font(.mantserrat(.medium, size: 14))
            .background {
                Color.theme.lightGray
            }
            .cornerRadius(20)
            .multilineTextAlignment(.center)
    }
    
    func placeholderCenter<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .center,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
