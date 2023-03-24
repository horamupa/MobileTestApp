//
//  HomeCoordinator.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 20.03.2023.
//

import Foundation

import SwiftUI

class HomeCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var sheet: HomeSheets?
    @Published var fullScreenCover: HomeFullScreenCover?
    
    @Published var vmHome: HomeViewModel?
    
    private unowned let mainCoordinator: Coordinator
    
    init(mainCoordinator: Coordinator) {
        self.mainCoordinator = mainCoordinator
    }
    
    func push(_ page: HomePages ) {
        path.append(page)
    }
    
    func sheet(_ sheet: HomeSheets) {
        self.sheet = sheet
    }
    
    func fullScreenCover(_ fullScreenCover: HomeFullScreenCover) {
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
    func build(page: HomePages) -> some View {
        switch page {
        case .homeView:
            HomeView(vm: .init(dataManager: self.mainCoordinator.dataManager))
        case .productView:
            ProductView(model: ProductModel.shared)
        }
    }
    
    @ViewBuilder
    func present(sheet: HomeSheets) -> some View {
        switch sheet {
        case .none:
            NavigationStack {
                SheetView()
            }
        }
    }
    
//    @ViewBuilder
//    func presentFull(fullScreenCover: HomeFullScreenCover) -> some View {
//        switch fullScreenCover {
//        case .none:
//            NavigationStack {
//                AuthView()
//            }
//        }
//    }
}

enum HomePages: String, Identifiable {
    case homeView, productView
    
    var id: String {
        self.rawValue
    }
}

enum HomeSheets: String, Identifiable {
    case none
    
    var id: String {
        self.rawValue
    }
}

enum HomeFullScreenCover: String, Identifiable {
    case none
    
    var id: String {
        self.rawValue
    }
}
