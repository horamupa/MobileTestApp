//
//  FullScreenCoverView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var coordinator: Coordinator
//    @State var tabSelection: TabBarItem = .home

    var body: some View {
    
        CustomTabBarContainerView(selection: $coordinator.tabSelection) {
            HomeCoordinatorView(coordinator: coordinator.homeCoordinator)
                .tabBarItem(tab: .home, selection: $coordinator.tabSelection)
                .tag(TabBarItem.home)
            HeartView()
                .tabBarItem(tab: .heart, selection: $coordinator.tabSelection)
                .tag(TabBarItem.heart)
            CartView()
                .tabBarItem(tab: .cart, selection: $coordinator.tabSelection)
                .tag(TabBarItem.cart)
            DialogView()
                .tabBarItem(tab: .dialog, selection: $coordinator.tabSelection)
                .tag(TabBarItem.dialog)
            NavigationView {
                ProfileView()
            }
            .tabBarItem(tab: .profile, selection: $coordinator.tabSelection)
            .tag(TabBarItem.profile)
        }
//        .fullScreenCover(isPresented: $coordinator.authManager.isUserNil) {
//            AuthView()
//        }
    }
}

struct FullScreenCoverView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TabBarView()
                .environmentObject(dev.coordinator)
        }
    }
}
