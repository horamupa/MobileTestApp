//
//  CustomTabBarView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

struct CustomTabBarView: View {
    
    var tabs: [TabBarItem]
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
            .padding(.top, 8)
            .background {
                Color.white.ignoresSafeArea(edges: .bottom)
            }
        }
        .background {
            Color.white
                .frame(height: 100)
                .offset(y: 40)
                .ignoresSafeArea(edges: .bottom)
        }
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
                .foregroundColor(selection == tab ? Color.theme.tabIconAccent : Color.clear)
        }
        .frame(height: 50)
    }
    
    
    private func switchToTab(tab: TabBarItem) {
//        withAnimation(.easeInOut) {
            selection = tab
//        }
    }
}


