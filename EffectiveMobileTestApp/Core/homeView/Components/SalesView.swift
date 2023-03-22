//
//  SalesView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 17.03.2023.
//

import SwiftUI

struct SalesView: View {
    
    var model: FlashSaleModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImageView(url: model.imageURL)
                .frame(width: UIScreen.main.bounds.width / 2 - 14)
                .clipped()
                .cornerRadius(10)
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Image("shopImage")
                    Spacer()
                    VStack {
                        Text(model.category)
                            .font(.mantserrat(.semibold, size: 14))
                            .foregroundColor(Color.black)
                            .padding(.vertical, 2)
                            .padding(.horizontal, 4)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(10)
                            .tracking(-0.5)
                        Text(model.name)
                            .font(.mantserrat(.bold, size: 16))
                            .foregroundColor(.white)
                            .minimumScaleFactor(0.9)
                            .lineLimit(2, reservesSpace: true)
                        Text("$" + "\(model.price)")
                            .font(.mantserrat(.bold, size: 16))
                            .foregroundColor(.white)
                    }
                    .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 0)
                }
                .padding(.leading, 4)
                Spacer()
                VStack {
                    Text("\(model.discount)% off")
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
        SalesView(model: dev.flashSaleModel)
            .previewLayout(.sizeThatFits)
            .frame(height: 221)
    }
}


struct SalesEmptyView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(style: .init(lineWidth: 1))
                .padding(1)
                .foregroundColor(.black.opacity(0.5))
                .frame(width: UIScreen.main.bounds.width / 2 - 14)
            Text("No items in category")
                .font(.mantserrat(.regular, size: 8))
                .foregroundColor(Color.theme.middleGray)
        }
    }
}
