//
//  SalesView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 17.03.2023.
//

import SwiftUI

struct SalesView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("waha2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width / 2 - 14)
                .clipped()
                .cornerRadius(10)
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Image("shopImage")
                    Spacer()
                    Text("Games")
                        .font(.mantserrat(.semibold, size: 14))
                        .foregroundColor(Color.black)
                        .padding(.vertical, 2)
                        .padding(.horizontal, 4)
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                        .tracking(-0.5)
                    Text("Ultramarin")
                        .font(.mantserrat(.bold, size: 16))
                        .foregroundColor(.white)
                        .minimumScaleFactor(0.9)
                        .lineLimit(2, reservesSpace: true)
                    Text("$ Price")
                        .font(.mantserrat(.bold, size: 16))
                        .foregroundColor(.white)
                }
                .padding(.leading, 4)
                Spacer()
                VStack {
                    Text("30% off")
                        .font(.mantserrat(.bold, size: 12))
                        .foregroundColor(Color.white)
                        .background {
                            Capsule()
                                .foregroundColor(Color.theme.discountColor)
                                .frame(width: 60, height: 18)
                        }
                    Spacer()
                    HStack {
                        ZStack {
                            Circle()
                                .foregroundColor(Color.theme.lightGray)
                                .frame(width: 28, height: 28)
                            Image("heart")
                        }
                        ZStack {
                            Circle()
                                .foregroundColor(Color.theme.lightGray)
                                .frame(width: 35, height: 35)
                            Image("bigPlus")
                            .foregroundColor(Color.white.opacity(0.8))
                        }
                    }
                }
            }
            .padding(8)
        }
        .frame(width: UIScreen.main.bounds.width / 2 - 14)
    }
}

struct SalesView_Previews: PreviewProvider {
    static var previews: some View {
        SalesView()
            .previewLayout(.sizeThatFits)
            .frame(height: 221)
    }
}
