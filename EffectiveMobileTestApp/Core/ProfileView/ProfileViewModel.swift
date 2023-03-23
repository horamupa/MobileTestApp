//
//  ProfileViewModel.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 23.03.2023.
//

import SwiftUI
import Combine

class ProfileViewModel: ObservableObject {
    @Published var profileImage: UIImage?
    @Published var isImagePicker: Bool = false
    private var cancellables = Set<AnyCancellable>()
    var userProfile: UserService
    
    init(userProfile: UserService) {
        self.userProfile = userProfile
        getPhoto()
    }
    
    func getPhoto() {
        userProfile.$userImage
            .sink { item in
                self.profileImage = item
            }
            .store(in: &cancellables)
    }
    
    
    
    
}
