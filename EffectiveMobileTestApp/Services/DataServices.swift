//
//  DataServices.swift
//  Trip Map
//
//  Created by MM on 17.01.2023.
//

import SwiftUI
import Combine

protocol DataServiceProtocol: ObservableObject {
    var latesData: [LatestModel] { get set }
    var flashSaleData: [FlashSaleModel] { get set }
    func fetchData()
}

class DataService: ObservableObject, DataServiceProtocol {
    @Published var latesData: [LatestModel] = []
    @Published var flashSaleData: [FlashSaleModel] = []
    var cancellables = Set<AnyCancellable>()
    private let latestURL = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
    private let flashSaleURL = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
    static let shared = DataService()

    init() {
        fetchData()
    }
    
    func fetchData() {
//        getLatest()
//        getSale()
    }
    
    private func getLatest() {
        guard let url = URL(string: latestURL) else { return }
        
        NetworkingManager.download(url: url)
            .decode(type: [LatestModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedData) in
                self?.latesData = returnedData
            })
            .store(in: &cancellables)
    }
    
    private func getSale() {
        guard let url = URL(string: flashSaleURL) else { return }
        
        NetworkingManager.download(url: url)
            .decode(type: [FlashSaleModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedData) in
                self?.flashSaleData = returnedData
            })
            .store(in: &cancellables)
    }
    
//    private func getFakeData() {
//        allShops = [
//            .init(id: 820, lat: 13.9650239, lng: 100.7475704, city: "Bangkok", name: "BloomCoffeShop", website: "https://www.facebook.com/Labtreeog/", description: "The most Perfect CoffeShop you ever seen. You can boy flowers, dubs, preroll and all kind equipment needed for smoking. Visit us whatever you will be nearby", titleimages: "https://i.pinimg.com/originals/b3/47/fd/b347fd7757c2b414e349613c781968d5.jpg", imageurl: ["Bloom1", "Bloom2", "Bloom3"], rating: 4, reviews: 24, address: "Somewhere in Thailand", badges: nil),
//            .init(id: 32, lat: 13.714291826642416, lng: 100.59325405501862, city: "Bangkok", name: "Daddy's", website: "https://www.facebook.com/Labtreeog/", description: "The most Perfect CoffeShop you ever seen. You can boy flowers, dubs, preroll and all kind equipment needed for smoking. Visit us whatever you will be nearby", titleimages: "https://www.vistanet.it/cagliari/wp-content/uploads/sites/2/2017/12/cagliari-cannabis-store-amsterdam.jpeg", imageurl: [ "https://www.vistanet.it/cagliari/wp-content/uploads/sites/2/2017/12/cagliari-cannabis-store-amsterdam.jpeg", "https://rubic.us/wp-content/uploads/2020/04/IMG_451593937-3.jpg"], rating: 5, reviews: 32, address: "Somewhere in Thailand", badges: nil),
//            .init(id: 12, lat: 13.744074868310383, lng: 100.54968595468333, city: "Bangkok", name: "High Society BKK Cannabis Dispensary/Weed shop", website: "https://www.facebook.com/Labtreeog/", description: "The most Perfect CoffeShop you ever seen. You can boy flowers, dubs, preroll and all kind equipment needed for smoking. Visit us whatever you will be nearby", titleimages: "https://www.dagospia.com/img/foto/12-2019/cannabis-store-amsterdam-7-1251465.jpg", imageurl: [ "https://www.vistanet.it/cagliari/wp-content/uploads/sites/2/2017/12/cagliari-cannabis-store-amsterdam.jpeg", "https://rubic.us/wp-content/uploads/2020/04/IMG_451593937-3.jpg"], rating: 4.3, reviews: 632, address: "Somewhere in Thailand", badges: nil),
//            .init(id: 34, lat: 13.74023967587193, lng: 100.55852651550421, city: "Bangkok", name: "Cloud Nine", website: "https://www.facebook.com/Labtreeog/", description: "The most Perfect CoffeShop you ever seen. You can boy flowers, dubs, preroll and all kind equipment needed for smoking. Visit us whatever you will be nearby", titleimages: "https://live.staticflickr.com/1963/31508836278_cf58ac64ba_b.jpg", imageurl: [ "https://www.vistanet.it/cagliari/wp-content/uploads/sites/2/2017/12/cagliari-cannabis-store-amsterdam.jpeg", "https://rubic.us/wp-content/uploads/2020/04/IMG_451593937-3.jpg"], rating: 4.1, reviews: 90, address: "Somewhere in Thailand", badges: nil)
//
//        ]
//    }
}

