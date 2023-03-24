//
//  ProductView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

struct ProductView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var homeCoordinator: HomeCoordinator
    @State var selection: Int = 0
    @State var colorSelection: String = ""
    var finalPrice: Double { model.price * Double(quantity)}
    @State var quantity: Int = 1
    var model: ProductModel

    init(model: ProductModel) {
        self.model = model
    }
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack {
                VStack {
                    imageSection
                    imagePreviewSection
                    infoSection
                }
                .ignoresSafeArea()
                
                Spacer()
                bottomSection
            }
            .navigationBarBackButtonHidden()
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductView(model: ProductModel.shared)
        }
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
        .cornerRadius(8)
        
        .overlay(alignment: .bottomTrailing) {
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .foregroundColor(Color.theme.lightGray)
                    .frame(width: 42, height: 95)
                    .overlay(alignment: .center) {
                        VStack(spacing: 12) {
                            likeButton
                            Image("LineProduct")
                            shareButton
                        }
                    }
                
            }
            .offset(x: 20)
            .padding(.bottom, 30)
        }
        .overlay(alignment: .topLeading, content: {
            backChevron
                .padding(.leading, 19)
                .offset(y: -8)
        })
        .padding(.trailing, 52)
        .padding(.top, 60)
        .tabViewStyle(.page)
        .offset(x: -5)
    }
    
    private var imagePreviewSection: some View {
        HStack {
            ForEach(model.imageUrls, id: \.self) { item in
                AsyncImageView(url: item)
                    .frame(
                        width: selection == model.imageUrls.firstIndex(of: item) ? 83 : 65,
                        height: selection == model.imageUrls.firstIndex(of: item) ?  45 : 37)
                    .cornerRadius(4)
                    .shadow(
                        radius: selection == model.imageUrls.firstIndex(of: item) ? 4 : 0,
                        y: selection == model.imageUrls.firstIndex(of: item) ? 4 : 0)
                    .onTapGesture {
                        selection = model.imageUrls.firstIndex(of: item) ?? 0
                    }
            }
        }
        .padding(.top, 25)
    }
    
    private var infoSection: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 16) {
                Text(model.name)
                    .font(.mantserrat(.semibold, size: 17))
                Text(model.description)
                    .font(.mantserrat(.regular, size: 12))
                    .foregroundColor(Color.theme.productGray)
                HStack(spacing: 4) {
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 12, height: 12)
                        .foregroundColor(Color.theme.yellow)
                    Text("\(model.rating.formatted())")
                        .font(.mantserrat(.semibold, size: 12))
                    Text("("+"\(model.numberOfReviews)"+" reviews)")
                        .font(.mantserrat(.medium, size: 12))
                        .foregroundColor(Color.theme.productGray)
                }
                Text("Color:")
                    .font(.mantserrat(.semibold, size: 16))
                    .foregroundColor(Color.theme.productGray)
                HStack(spacing: 15) {
                    ForEach(model.colors, id: \.self) { color in
                        RoundedRectangle(cornerRadius: 9)
                            .frame(width: 34, height: 26)
                            .foregroundColor(Color(hex: color))
                            .onTapGesture {
                                colorSelection = color
                            }
                            .overlay {
                                if colorSelection == color {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(lineWidth: 2)
                                        .foregroundColor(Color.theme.productGray)
                                }
                            }
                    }
                }
            }
            .frame(maxWidth: UIScreen.main.bounds.width/1.5)
            Spacer()
            Text("$ "+"\(model.price)")
                .font(.mantserrat(.semibold, size: 13))
        }
        .padding(.horizontal, 25)
        .padding(.top, 20)

    }
    
    private var addToCartButton: some View {
        Button {
            coordinator.changeTab(.cart)
        } label: {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 170, height: 44)
                .foregroundColor(Color.theme.menuBlue)
                .overlay {
                    HStack(spacing: 0) {
                        Text("$"+"\(finalPrice.formatted())")
                            .font(.mantserrat(.semibold, size: 10))
                            .foregroundColor(Color.theme.menuBlue2)
                        Spacer()
                        Text("ADD TO CARD")
                            .font(.mantserrat(.bold, size: 10))
                            .foregroundColor(.white)
                            .lineLimit(1)
                    }
                    .padding(.horizontal, 25)
                }
        }
    }
    
    private var minusButton: some View {
        Button {
            if quantity > 0 {
                quantity -= 1
            }
        } label: {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color.theme.menuBlue)
                .frame(width: 38, height: 22)
                .overlay {
                    Image("ProductMinus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 13)
                        .foregroundColor(.white)
                }
        }
    }
    
    private var plusButton: some View {
        Button {
            quantity += 1
        } label: {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color.theme.menuBlue)
                .frame(width: 38, height: 22)
                .overlay {
                    Image("ProductPlus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 13, height: 13)
                        .foregroundColor(.white)
                        
                }
        }
    }
    
    private var bottomSection: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 172)
                .foregroundColor(Color.theme.darkBlue)
            HStack {
                VStack(alignment: .leading) {
                    Text("Quantity: " + "\(quantity)")
                        .font(.mantserrat(.regular, size: 11))
                        .foregroundColor(Color.theme.middleGray)
                    HStack(spacing: 20) {
                        minusButton
                        plusButton
                    }
                }
                Spacer()
                addToCartButton
            }
            .padding(.top, 19)
            .padding(.horizontal, 30)
        }
    }
    
    private var likeButton: some View {
        Button {
            
        } label: {
            Image("HeartProduct")
        }
    }
    
    private var shareButton: some View {
        Button {
            
        } label: {
            Image("ShareProduct")
        }
    }
    
    private var backChevron: some View {
        Button {
            homeCoordinator.pop()
        } label: {
            Image(systemName: "chevron.left")
                .bold()
                .foregroundColor(.black)
        }
    }
    
    private var plusMinusBitton: some View {

        RoundedRectangle(cornerRadius: 8)
            .foregroundColor(Color.theme.menuBlue)
            .frame(width: 38, height: 22)
            .overlay {
                Image(systemName: "minus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 13)
                    .foregroundColor(.white)
            }
    }
}
