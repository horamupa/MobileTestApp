//
//  CustomTabBarView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

struct CustomTabBarItem: View {
    
    var tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    
    var body: some View {
        ZStack {
            HStack {
//                Color.red
                ForEach(tabs, id: \.self) { tab in
                    tabView(tab: tab)
                        .onTapGesture {
                            switchToTab(tab: tab)
                        }
                    }
            }
            .padding(8)
            .background {
                Color.white.ignoresSafeArea(edges: .bottom)
            }
        }
        
//        .ignoresSafeArea(edges: .bottom)
//                    .background(Color.white.ignoresSafeArea(edges: .bottom))
        .background {
//            Color.white.ignoresSafeArea(edges: .bottom)
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
            CustomTabBarItem(tabs: dev.tabs, selection: .constant(dev.tabs.first!))
        }
    }
}

extension CustomTabBarItem {

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
    
//    private var tabView2: some View {
//        ZStack {
//            Circle()
//                .frame(height: 45)
//                .foregroundColor(selection == tab ? Color.theme.lightGray : .clear)
//            Image(tab.image)
//                .padding(8)
//                .frame(maxWidth: .infinity)
//        }
//        .frame(height: 50)
//    }
    
    private func switchToTab(tab: TabBarItem) {
        withAnimation(.easeInOut) {
            selection = tab
        }
    }
    
//    private var customTabBar1: some View {
//        ZStack {
//            HStack {
//                ForEach(tabs, id: \.self) { tab in
//                    tabView(tab: tab)
//                        .onTapGesture {
//                            switchToTab(tab: tab)
//                        }
//                }
//            }
//            .padding(8)
//            .background(Color.white.ignoresSafeArea(edges: .bottom))
//            .cornerRadius(20)
////            Color.white
////                .frame(height: 50)
////                .offset(y: 50)
//        }
//        .ignoresSafeArea(edges: .bottom)
//    }
}


