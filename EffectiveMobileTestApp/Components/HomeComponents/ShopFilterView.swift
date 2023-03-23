//
//  ShopFilterView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 16.03.2023.
//

import SwiftUI

struct ShopFilterView: View {
    @Binding var selectedOption: ShopFilterOptions
    var vm: HomeViewModel
    var body: some View {
            HStack {
                ForEach(ShopFilterOptions.allCases, id: \.self) { item in
                    VStack(spacing: 10) {
                        ZStack {
                            Circle()
                                .foregroundColor(Color.theme.lightGray)
                                .frame(width: 42, height: 38)
                                .shadow(
                                    color: Color.theme.middleGray.opacity(vm.isSelectedOption == item ? 0.5 : 0),
                                    radius: 2,
                                    x: 0,
                                    y: 2)
                            Image(item.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        }
                        Text(item.image)
                            .font(.mantserrat(.regular, size: 8))
                    }
                    .onTapGesture {
                        vm.setFilter(category: item.image)
                        vm.setSelectedOption(option: item)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            
    }
}

struct ShopFilterView_Previews: PreviewProvider {
    static var previews: some View {
        ShopFilterView(selectedOption: .constant(.phones), vm: HomeViewModel(dataManager: dev.dataManager))
    }
}

enum ShopFilterOptions: Int, CaseIterable {
    case phones
    case headphones
    case game
    case cars
    case furniture
    case kids
    
    var image: String {
        switch self {
        case .phones:
            return "Phones"
        case .headphones:
            return "Headphones"
        case .game:
            return "Games"
        case .cars:
            return "Cars"
        case .furniture:
            return "Furniture"
        case .kids:
            return "Kids"
        }
    }
}
