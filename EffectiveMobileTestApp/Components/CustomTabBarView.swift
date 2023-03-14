//
//  CustomTabBarView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

struct CustomTabBarView: View {
    
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    
    var body: some View {
        ZStack {
            HStack {
                ForEach(tabs, id: \.self) { tab in
                    tabView(tab: tab)
                        .onTapGesture {
                            switchToTab(tab: tab)
                        }
                }
            }
            .padding(8)
            .background(Color.green.opacity(0.2).ignoresSafeArea(edges: .bottom))
            .cornerRadius(20)
            Color.green.opacity(0.2)
                .frame(height: 50)
                .offset(y: 50)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            Spacer()
            CustomTabBarView(tabs: dev.tabs, selection: .constant(dev.tabs.first!))
        }
    }
}

extension CustomTabBarView {

    private func tabView(tab: TabBarItem) -> some View {
        ZStack {
            Circle()
                .frame(height: 45)
                .foregroundColor(selection == tab ? Color.theme.lightGray : .clear)
            Image(tab.image)
                .padding(8)
                .frame(maxWidth: .infinity)
        }
        .frame(height: 50)
    }
    
    private func switchToTab(tab: TabBarItem) {
        withAnimation(.easeInOut) {
            selection = tab
        }
    }
    
    enum tabBarSelection {
        case home, heart, cart, dialog, profile
        
        var image: String {
            switch self {
            case .home:
               return "HomeLogo"
            case .heart:
                return "HeartLogo"
            case .cart:
                return "CartLogo"
            case .dialog:
                return "DialogLogo"
            case .profile:
                return "ProfileLogo"
            }
        }
    }
}


