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
    @Published var isAllDataFetched: Bool = false
    @Published var searchHint: [String] = []
    private var cancellables = Set<AnyCancellable>()
    var dataManager: DataService
    
    init(dataManager: DataService) {
        self.dataManager = dataManager
        getLatest()
        getFlashSale()
        checkFullLoading()
        addSearchFilter()
    }
    
    
    private func addSearchFilter() {
        $searchText
            .setFailureType(to: Error.self)
            .debounce(for: 1, scheduler: RunLoop.main)
            .combineLatest(dataManager.getSearch())
            .map { (text, hints) -> [String] in
                hints.words.filter { hint -> Bool in
                    hint.lowercased().contains(text.lowercased())
                }
            }
            .sink { error in
                print(error)
            } receiveValue: { value in
                self.searchHint = value
            }
            .store(in: &cancellables)
    }
    
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
    
    func checkFullLoading() {
        $latest
            .combineLatest($flashSale)
            .map { (latest, flashSale) -> Bool in
                if !latest.isEmpty && !flashSale.isEmpty {
                    return true
                }
                else {
                    return false }
                }
            .sink { value in
                self.isAllDataFetched = value
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
