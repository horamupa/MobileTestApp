//
//  DataServices.swift
//  Trip Map
//
//  Created by MM on 17.01.2023.
//

import SwiftUI
import Combine

//protocol DataServiceProtocol: ObservableObject {
//    func getLatest() -> AnyPublisher<Any, Error>
//    func getSale() -> AnyPublisher<Any, Error>
//}

class DataService: ObservableObject {
    @Published var hints: [String] = []
    private let latestURL = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
    private let flashSaleURL = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
    private let searchURL = "https://run.mocky.io/v3/4c9cd822-9479-4509-803d-63197e5a9e19"

    var cancellables = Set<AnyCancellable>()

    func getLatest() -> AnyPublisher<[LatestModel], Error> {
        #warning("Usage of !")
        let url = URL(string: latestURL)!
        
        return NetworkingManager.download(url: url)
            .decode(type: LatestJSON.self, decoder: JSONDecoder())
            .map({ data in
                data.latest
            })
            .eraseToAnyPublisher()
    }
    
    func getSale() -> AnyPublisher<[FlashSaleModel], Error> {
    #warning("Usage of !")
        let url = URL(string: flashSaleURL)!
        return NetworkingManager.download(url: url)
            .decode(type: FlashSaleJSON.self, decoder: JSONDecoder())
            .map({ data in
                data.flashSale
            })
            .eraseToAnyPublisher()
    }
    
    
    func getSearch() -> AnyPublisher<SearchModel, Error> {
    #warning("Usage of !")
        let url = URL(string: searchURL)!
        return NetworkingManager.download(url: url)
            .decode(type: SearchModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

