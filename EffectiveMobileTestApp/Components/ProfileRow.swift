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
                    .frame(height: 50)
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 23)
            }
            Text(text)
                .font(.mantserrat(.medium, size: 18))
            Spacer()
            if isChevron {
                Image(systemName: "chevron.right")
                    .bold()
            }
        }
    }
}

struct ProfileRow_Previews: PreviewProvider {
    static var previews: some View {
        ProfileRow(image: "CardLogo", text: "Trade Store", isChevron: true)
    }
}
