//
//  FullScreenCoverView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @State var tabSelection: TabBarItem = TabBarItem(image: "HomeLogo")
    

    var body: some View {
//        defTabBar
        CustomTabBarContainerView(selection: $tabSelection) {
            Color.red
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
        TabBarView()
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
