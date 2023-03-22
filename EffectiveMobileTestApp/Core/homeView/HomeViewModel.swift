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
    @Published var latestFiltred: [LatestModel] = []
    @Published var saleFiltred: [FlashSaleModel] = []
    @Published var selectedOptions: ShopFilterOptions = .phones
    @Published var isSelectedOption: ShopFilterOptions? = nil
    @Published var searchText: String = ""
    private var cancellables = Set<AnyCancellable>()
    var dataManager: DataService
    
    init(dataManager: DataService) {
        self.dataManager = dataManager
        getLatest()
        getFlashSale()
        
    }
    
//    private func addSearchFilter() {
//        $searchText
//            .combineLatest(DataService.shared.$allShops)
//            .map { (text, allShops) -> [ShopModel] in
//                guard !text.isEmpty else { return allShops }
//                let lowercasedText = text.lowercased()
//                return allShops.filter { shop in
//                    shop.name.lowercased().contains(text) ||
//                    shop.city.lowercased().contains(text)
//                }
//            }
//            .sink { [weak self] recivedValue in
//                self?.allShops = recivedValue
//            }
//            .store(in: &cancellables)
//    }
    
    func getLatest() {
        dataManager.getLatest()
            .sink { error in
                print(error)
            } receiveValue: { value in
                self.latest = value
            }
            .store(in: &cancellables)
    }
    
    func getFlashSale() {
        dataManager.getSale()
            .sink { error in
                print(error)
            } receiveValue: { value in
                self.flashSale = value
            }
            .store(in: &cancellables)
    }
    
    func setFilter(category: String) {
        $latest
            .map { array in
                  array.filter { element in
                     return element.category == category
                  }
               }
            .sink { value in
                self.latestFiltred = value
            }
            .store(in: &cancellables)
        
        $flashSale
            .map { array in
                  array.filter { element in
                     return element.category == category
                  }
               }
            .sink { value in
                self.saleFiltred = value
            }
            .store(in: &cancellables)
    }
    
    func setSelectedOption(option: ShopFilterOptions) {
        if self.isSelectedOption == option {
            self.isSelectedOption = nil
        } else {
            self.isSelectedOption = option
        }
    }
    
}
