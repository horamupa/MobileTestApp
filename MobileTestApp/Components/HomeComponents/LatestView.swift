//
//  LatestView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 17.03.2023.
//

import SwiftUI

struct LatestView: View {
    
    var model: LatestModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
                AsyncImageView(url: model.imageURL)
                    .frame(maxWidth: UIScreen.main.bounds.width / 3-14)
                    .clipped()
                    .cornerRadius(10)
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text(model.category)
                        .font(.mantserrat(.semibold, size: 8))
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                    Text(model.name)
                        .font(.mantserrat(.semibold, size: 10))
                        .foregroundColor(.white)
                        .lineLimit(2, reservesSpace: true)
                    Text("$ " + "\(model.price)")
                        .font(.mantserrat(.semibold, size: 10))
                        .foregroundColor(.white)
                }
                Spacer()
                Image("AddToCart")
            }
            .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 0)
            .padding(8)
            .tracking(-0.02)
        }
        .frame(width: UIScreen.main.bounds.width / 3-14)
    }
}

struct LatestView_Previews: PreviewProvider {
    static var previews: some View {
        LatestView(model: dev.latestModel)
            .previewLayout(.sizeThatFits)
            .frame(height: 149)
            .frame(width: UIScreen.main.bounds.width / 3-12)
    }
}

struct LatestEmptyView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(style: .init(lineWidth: 1))
                .padding(1)
                .foregroundColor(.black.opacity(0.5))
                .frame(width: UIScreen.main.bounds.width / 3-8)
            Text("No items in category")
                .font(.mantserrat(.regular, size: 8))
                .foregroundColor(Color.theme.middleGray)
        }
    }
}
