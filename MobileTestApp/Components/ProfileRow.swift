//
//  ProfileRow.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

struct ProfileRow: View {
    let image: String
    let text: String
    let isChevron: Bool
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .foregroundColor(Color.theme.lightGray)
                    .frame(height: 40)
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 16)
            }
            Text(text)
                .font(.mantserrat(.medium, size: 14))
            Spacer()
            if isChevron {
                Image("chevron.right")
            }
        }
    }
}

struct ProfileRow_Previews: PreviewProvider {
    static var previews: some View {
        ProfileRow(image: "CardLogo", text: "Trade Store", isChevron: true)
    }
}
