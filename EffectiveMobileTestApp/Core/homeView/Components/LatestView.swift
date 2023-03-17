//
//  LatestView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 17.03.2023.
//

import SwiftUI

struct LatestView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("waha2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: UIScreen.main.bounds.width / 3-8)
                .clipped()
                .cornerRadius(10)
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text("Games")
                        .font(.mantserrat(.regular, size: 10))
                        .tracking(-0.5)
                        .padding(.vertical, 2)
                        .padding(.horizontal, 4)
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                    Text("Ultramarin")
                        .font(.mantserrat(.bold, size: 10))
                        .foregroundColor(.white)
                        .lineLimit(2, reservesSpace: true)
                    Text("$ Price")
                        .font(.mantserrat(.bold, size: 10))
                        .foregroundColor(.white)
                }
                Spacer()
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color.white.opacity(0.8))
            }
            .padding(4)
        }
        .frame(maxWidth: UIScreen.main.bounds.width / 3-8)
    }
}

struct LatestView_Previews: PreviewProvider {
    static var previews: some View {
        LatestView()
            .previewLayout(.sizeThatFits)
            .frame(height: 149)
            .frame(width: UIScreen.main.bounds.width / 3-12)
    }
}
