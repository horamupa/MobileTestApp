//
//  ButtonView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 23.03.2023.
//

import SwiftUI

struct ButtonView: View {
    
    var text: String
    var body: some View {
        Text(text)
            .font(.mantserrat(.bold, size: 14))
            .frame(height: 46)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background {
                Color.theme.fbBlue
            }
            .cornerRadius(15)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "Sign in")
    }
}
