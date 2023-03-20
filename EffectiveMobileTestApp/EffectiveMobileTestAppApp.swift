//
//  EffectiveMobileTestAppApp.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

@main
struct EffectiveMobileTestAppApp: App {
    
    @StateObject var coordinator: Coordinator = Coordinator(dataManager: DataService(), authManager: AuthService())
    
    var body: some Scene {
        
        WindowGroup {
//            CoordinatorView()
            TabBarView()
                .environmentObject(coordinator)
        }
    }
}
