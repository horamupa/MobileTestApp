//
//  ProductView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

struct ProductView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @State var selection: Int = 0
    @State var colorSelection: String = ""
    var model: ProductModel

    init(model: ProductModel) {
        self.model = model
    }
    
    var body: some View {
        ScrollView {
            VStack {
                imageSection
                imagePreviewSection
                HStack {
                    VStack(alignment: .leading, spacing: 16) {
                        Text(model.name)
                            .font(.mantserrat(.semibold, size: 19))
                        Text(model.description)
                            .font(.mantserrat(.regular, size: 12))
                            .foregroundColor(Color.theme.middleGray)
                        HStack {
                            Image(systemName: "star")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(Color.theme.yellow)
                            Text("\(model.rating.formatted())")
                                .font(.mantserrat(.semibold, size: 12))
                            Text("("+"\(model.numberOfReviews)"+")")
                                .font(.mantserrat(.regular, size: 12))
                                .foregroundColor(Color.theme.middleGray)
                        }
                        Text("Color:")
                            .font(.mantserrat(.semibold, size: 16))
                            .foregroundColor(Color.theme.middleGray)
                        HStack {
                            ForEach(model.colors, id: \.self) { color in
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 34, height: 26)
                                    .foregroundColor(Color(hex: color))
                                    .onTapGesture {
                                        colorSelection = color
                                    }
                                    .overlay {
                                        if color == "#ffffff" {
                                            RoundedRectangle(cornerRadius: 10)
                                                .strokeBorder(lineWidth: 2, antialiased: false)
                                                .foregroundColor(Color.theme.middleGray)
                                        }
                                        if colorSelection == color {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke()
                                        }
                                    }
                            }
                        }
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width/1.5)
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("$"+"\(model.price)")
                            .font(.mantserrat(.semibold, size: 12))
                        Spacer()
                    }
                }
                .padding(.top, 10)
                .padding(.horizontal, 30)
            }
        }
        .ignoresSafeArea()
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(model: ProductModel.shared)
    }
}

extension ProductView {
    private var imageSection: some View {
        TabView(selection: $selection) {
            ForEach(model.imageUrls, id: \.self) { image in
                AsyncImageView(url: image)
                    .tag(Int(model.imageUrls.firstIndex(of: image) ?? 0))
            }
        }
        .frame(height: 279)
        .cornerRadius(20)
        .overlay(alignment: .bottomTrailing) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color.theme.lightGray)
                    .frame(width: 42, height: 95)
                    .overlay(alignment: .center) {
                        VStack(spacing: 12) {
                            Image("HeartProduct")
                            Image("LineProduct")
                            Image("ShareProduct")
                        }
                    }
                
            }
            .offset(x: 20)
            .padding(.bottom, 30)
        }
        .padding(.trailing, 40)
        .padding(.top, 40)
        .tabViewStyle(.page)
        
    }
    
    private var imagePreviewSection: some View {
        HStack {
            ForEach(model.imageUrls, id: \.self) { item in
                AsyncImageView(url: item)
                    .frame(
                        width: selection == model.imageUrls.firstIndex(of: item) ? 83 : 65,
                        height: selection == model.imageUrls.firstIndex(of: item) ?  45 : 37)
                    .cornerRadius(10)
                    .shadow(
                        radius: selection == model.imageUrls.firstIndex(of: item) ? 4 : 0,
                        y: selection == model.imageUrls.firstIndex(of: item) ? 4 : 0)
                    .onTapGesture {
                        selection = model.imageUrls.firstIndex(of: item) ?? 0
                    }
            }
        }
        .padding(.top, 20)
    }
    
}
