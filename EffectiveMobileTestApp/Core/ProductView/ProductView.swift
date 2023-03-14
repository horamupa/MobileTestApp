//
//  ProductView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

struct ProductView: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        Text("ProductView")
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
