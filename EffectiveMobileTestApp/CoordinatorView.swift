//
//  ContentView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject private var coordinator: Coordinator = Coordinator(dataManager: DataService(), authManager: AuthService())

    var body: some View {
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
                .environmentObject(coordinator)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView()
    }
}
