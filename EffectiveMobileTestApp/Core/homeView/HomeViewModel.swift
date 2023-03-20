//
//  HomeViewModel.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 17.03.2023.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var latest: [LatestModel] = []
    @Published var flashSale: [FlashSaleModel] = []
    private var cancellables = Set<AnyCancellable>()
    var dataManager: any DataServiceProtocol
    
    init(dataManager: any DataServiceProtocol) {
        self.dataManager = dataManager
        self.latest = latest
        self.flashSale = flashSale
    }
    
    func getLatest() {
        dataManager.latesData
            
    }
    
    func getFlashSale() {
        
    }
    
}
