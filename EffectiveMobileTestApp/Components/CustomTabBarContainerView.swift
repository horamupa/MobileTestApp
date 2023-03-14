//
//  CustomTabBarContainerView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

struct CustomTabBarContainerView<Content: View>: View {
    
    @Binding var selection: TabBarItem
    let content: Content
    let tabs: [TabBarItem] = [
        TabBarItem(image: "HomeLogo"),
    TabBarItem(image: "HeartLogo"),
    TabBarItem(image: "CartLogo"),
    TabBarItem(image: "DialogLogo"),
    TabBarItem(image: "ProfileLogo")
        ]
    init(selection: Binding<TabBarItem>, content: () -> Content) {
        _selection = selection
        self.content = content()
    }
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                content
//                    .ignoresSafeArea()
            }
            CustomTabBarView(tabs: tabs, selection: $selection)
        }
    }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarContainerView(selection: .constant(dev.tabs.first!)) {
            Color.red
        }
    }
}
