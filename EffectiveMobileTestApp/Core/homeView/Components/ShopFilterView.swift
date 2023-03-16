//
//  ShopFilterView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 16.03.2023.
//

import SwiftUI

struct ShopFilterView: View {
    @Binding var selectedOption: ShopFilterOptions
    var body: some View {
            HStack {
                ForEach(ShopFilterOptions.allCases, id: \.self) { item in
                    VStack {
                        ZStack {
                            Circle()
                                .foregroundColor(Color.theme.lightGray)
                                .frame(width: 42, height: 38)
                            Image(item.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        }
//                        .frame(height: 38)
                        Text(item.image)
                            .font(.mantserrat(.regular, size: 8))
                            .foregroundColor(Color.theme.middleGray)
//                            .foregroundColor(item == selectedOption ? .white : .white.opacity(0.7))
//                        if selectedOption == item {
//                            Capsule()
//                                .fill(.white)
//                                .frame(height: 3)
//                                .padding(.horizontal, -4)
//                                .offset(y: -4)
//                        } else {
//                            Capsule()
//                                .fill(.clear)
//                                .frame(height: 3)
//                                .padding(.horizontal, -4)
//                                .offset(y: -4)
//                        }
                    }
//                    .padding(.horizontal, 8)
//                    .onTapGesture {
//                        self.selectedOption = item
//                    }
                    .frame(maxWidth: .infinity)
                }
            }
            
    }
}

struct ShopFilterView_Previews: PreviewProvider {
    static var previews: some View {
        ShopFilterView(selectedOption: .constant(.mobile))
    }
}

enum ShopFilterOptions: Int, CaseIterable {
    case mobile
    case headphones
    case game
    case cars
    case furniture
    case kids
    
    var image: String {
        switch self {
        case .mobile:
            return "Mobile"
        case .headphones:
            return "Headphones"
        case .game:
            return "Games"
        case .cars:
            return "Car"
        case .furniture:
            return "Furniture"
        case .kids:
            return "Kids"
        }
    }
}
