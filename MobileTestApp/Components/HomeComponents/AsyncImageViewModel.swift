//
//  AsyncImageViewModel.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 21.03.2023.
//

import SwiftUI
import Combine

class AsyncImageViewModel: ObservableObject {
    
    @Published var image: UIImage?
    @Published var isLoading: Bool = false
    private let dataService: ImageDownloadService
    private var cancellables = Set<AnyCancellable>()
    
    init(url: String) {
//        self.shop = shop
        self.dataService = ImageDownloadService(urlString: url)
        self.isLoading = true
        addSubscribers()
    }
    
    private func addSubscribers() {
        dataService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] sinkImage in
                self?.image = sinkImage
            }
            .store(in: &cancellables)
    }
    
}
