//
//  Coordinator.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

enum Page: String, Identifiable {
    case authView, homeView, profileView, productView
    
    var id: String {
        self.rawValue
    }
}

enum Sheet: String, Identifiable {
    case sheetView
    
    var id: String {
        self.rawValue
    }
}

enum FullScreenCover: String, Identifiable {
    case TabBarView
    
    var id: String {
        self.rawValue
    }
}

class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    
    func push(_ page: Page ) {
        path.append(page)
    }
    
    func sheet(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    func fullScreenCover(_ fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func pop() {
        self.path.removeLast()
    }
    
    func popToRoot() {
        self.path.removeLast(path.count )
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .authView:
            AuthView()
        case .homeView:
            HomeView()
        case .profileView:
            ProfileView()
        case .productView:
            ProductView()
        }

    }
    
    @ViewBuilder
    func present(sheet: Sheet) -> some View {
        switch sheet {
        case .sheetView:
            NavigationStack {
                SheetView()
            }
        }
    }
    
    @ViewBuilder
    func presentFull(fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .TabBarView:
            NavigationStack {
                TabBarView()
            }
        }
    
    }
}
