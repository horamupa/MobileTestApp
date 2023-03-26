//
//  CustomTabBarContainerView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

struct CustomTabBarContainerView<Content: View>: View {
    
    @Binding var selection: TabBarItem
    var content: Content
    @State var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        _selection = selection
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottom) {
                content
                    .ignoresSafeArea()
                layoutNavBarFix
                CustomTabBarView(tabs: tabs, selection: $selection)
                    .cornerRadius(30, corners: [.topRight, .topLeft])
            }
        }
        .onPreferenceChange(TabBarItemPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarContainerView(selection: .constant(dev.tabs.first!)) {
            Color.clear
        }
    }
}

extension CustomTabBarContainerView {
    private var layoutNavBarFix: some View {
        Color.white
            .frame(height: 80)
            .offset(y: 40)
            .ignoresSafeArea(edges: .bottom)
    }
}
