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
//        self.finalPrice = Double(model.price)
    }
    
    var body: some View {
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
//        .toolbar {
//            ToolbarItem(placement: .navigationBarLeading) {
//
//            }
//        }
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
        .cornerRadius(20)
        .overlay(alignment: .bottomTrailing) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
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
                .padding(.leading)
                .offset(y: -8)
        })
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
    
    private var infoSection: some View {
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
                Text("$ "+"\(model.price)")
                    .font(.mantserrat(.semibold, size: 12))
                Spacer()
            }
        }
        .padding(.horizontal, 30)

    }
    
    private var addToCartButton: some View {
        Button {
            coordinator.changeTab(.cart)
        } label: {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 170, height: 44)
                .foregroundColor(Color.theme.menuBlue)
                .overlay {
                    HStack(spacing: 15) {
                        Text("$ "+"\(finalPrice.formatted())")
                            .font(.mantserrat(.semibold, size: 10))
                            .foregroundColor(Color.theme.menuBlue2)
                        Text("ADD TO CARD")
                            .font(.mantserrat(.bold, size: 10))
                            .foregroundColor(.white)
                    }
                }
        }
    }
    
    private var minusButton: some View {
        Button {
            if quantity > 0 {
                quantity -= 1
            }
        } label: {
            RoundedRectangle(cornerRadius: 10)
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
    
    private var plusButton: some View {
        Button {
            quantity += 1
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.theme.menuBlue)
                .frame(width: 38, height: 22)
                .overlay {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 13, height: 13)
                        .foregroundColor(.white)
                        
                }
        }
    }
    
    private var bottomSection: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 100)
                .foregroundColor(Color.theme.darkBlue)
            HStack {
                VStack(alignment: .leading) {
                    Text("Quantity: " + "\(quantity)")
                        .font(.mantserrat(.regular, size: 10))
                        .foregroundColor(Color.theme.middleGray)
                    HStack(spacing: 20) {
                        minusButton
                        plusButton
                    }
                }
                Spacer()
                addToCartButton
            }
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
}
