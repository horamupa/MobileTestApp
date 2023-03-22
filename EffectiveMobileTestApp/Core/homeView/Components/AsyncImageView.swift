//
//  AsyncImageView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 21.03.2023.
//

import SwiftUI

struct AsyncImageView: View {
    
    @StateObject var vm: AsyncImageViewModel
    init(url: String) {
        _vm = StateObject(wrappedValue: AsyncImageViewModel(url: url))
    }
    
    var body: some View {
        if let image = vm.image {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                
        } else if vm.isLoading {
            ProgressView()
        } else {
            Image(systemName: "questionmark.app")
//                .foregroundColor(Color.theme.background)
        }
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
//        ShopImageView()
        ProgressView()
            
    }
}
