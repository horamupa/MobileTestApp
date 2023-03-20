//
//  FullScreenCoverView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var coordinator: Coordinator
    @State var tabSelection: TabBarItem = .home
//    @State private var isCustomNavBar = false

    var body: some View {
    
        CustomTabBarContainerView(selection: $tabSelection) {
//            HomeView()
            HomeCoordinatorView(coordinator: coordinator.homeCoordinator)
                .tabBarItem(tab: .home, selection: $tabSelection)
                .tag(TabBarItem.home)
            HeartView()
                .tabBarItem(tab: .heart, selection: $tabSelection)
                .tag(TabBarItem.heart)
            CartView()
                .tabBarItem(tab: .cart, selection: $tabSelection)
                .tag(TabBarItem.cart)
            DialogView()
                .tabBarItem(tab: .dialog, selection: $tabSelection)
                .tag(TabBarItem.dialog)
            NavigationView {
                ProfileView()
            }
            .tabBarItem(tab: .profile, selection: $tabSelection)
            .tag(TabBarItem.profile)
            
        }
        .fullScreenCover(isPresented: $coordinator.authManager.isUserNil) {
            AuthView()
        }
        /*
        VStack {
            Text("FullScreenCoverView")
            Button {
                coordinator.dismissFullScreenCover()
            } label: {
                Text("DismissFullScreenCover")
            }
        }
         */
    }
}

struct FullScreenCoverView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TabBarView()
        }
    }
}

extension TabBarView {
//    private var defTabBar: some View {
//        TabView(selection: $selection) {
//            Color.red
//                .tabItem {
//                    Image("HomeLogo")
//                        .resizable()
//                        .scaledToFit()
//                }
//            Color.blue
//                .tabItem {
//                    Image("HeartLogo")
//                }
//            Color.gray
//                .tabItem {
//                    Image("CartLogo")
//                }
//            Color.pink
//                .tabItem {
//                    Image("DialogLogo")
//                }
//            Color.green
//                .tabItem {
//                    Image("ProfileLogo")
//                }
//        }
//    }
}
