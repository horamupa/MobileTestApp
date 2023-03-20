//
//  ContentView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject private var coordinator: Coordinator = Coordinator(dataManager: DataService(), authManager: AuthService())
//    @StateObject var authManager = AuthService()
    
//    var dataManager = DataService()
    var body: some View {
//        if authManager.user == nil {
//            authStack
//                .environmentObject(coordinator)
//        } else {
            tabBarStack
                .environmentObject(coordinator)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView()
    }
}


extension CoordinatorView {
    private var authStack: some View {
        NavigationView {
            AuthView()
                .environmentObject(coordinator)
        }
//        NavigationStack(path: $coordinator.authPath) {
//            coordinator.presentFull(fullScreenCover: .authView)
//                .navigationDestination(for: Page.self) { page in
//                    coordinator.build(page: page)
//                }
//                .sheet(item: $coordinator.sheet) { sheet in
//                    coordinator.present(sheet: sheet)
//                }
//                .fullScreenCover(item: $coordinator.fullScreenCover) { fullScreenCover in
//                    coordinator.presentFull(fullScreenCover: fullScreenCover)
//                }
//        }
    }
    
    private var tabBarStack: some View {
        NavigationStack(path: $coordinator.path) {
//            coordinator.build(page: .tabBarView)
            coordinator.build(page: .authView)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.present(sheet: sheet)
                }
                .fullScreenCover(item: $coordinator.fullScreenCover) { fullScreenCover in
                    coordinator.presentFull(fullScreenCover: fullScreenCover)
                }
        }
    }
}
