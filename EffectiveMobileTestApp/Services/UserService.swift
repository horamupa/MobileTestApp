//
//  User.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 22.03.2023.
//

import SwiftUI
import Combine

class UserService: ObservableObject {
    @Published var userImage: UIImage?
    @Published var userName: String? = "Satria Adhi Pradana"
    @Published var userCash: Double? = 1593
    private var cancellables = Set<AnyCancellable>()
    
    func setImage(image: UIImage) {
        self.userImage = image
    }
    
    func getImage() -> UIImage? {
        return self.userImage
    }
    
//    func getImage() -> AnyPublisher<UIImage?, Error> {
//
//        return $userImage
//                .eraseToAnyPublisher()
            
        
//        return NetworkingManager.download(url: url)
//            .decode(type: LatestJSON.self, decoder: JSONDecoder())
//            .map({ data in
//                data.latest
//            })
//            .eraseToAnyPublisher()
//    }
}
