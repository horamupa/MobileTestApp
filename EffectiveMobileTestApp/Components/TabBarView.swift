//
//  FullScreenCoverView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        VStack {
            Text("FullScreenCoverView")
            Button {
                coordinator.dismissFullScreenCover()
            } label: {
                Text("DismissFullScreenCover")
            }
        }
    }
}

struct FullScreenCoverView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
