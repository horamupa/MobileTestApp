//
//  ImageDownloadService.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 21.03.2023.
//

import SwiftUI
import Combine

class ImageDownloadService {
    @Published var image: UIImage?
    
    private var imageSubscription: AnyCancellable?
    
    init(urlString: String) {
        getImage(urlString: urlString)
    }
    
    private func getImage(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
                self?.imageSubscription?.cancel()
            })

    }
}
