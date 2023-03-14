//
//  HomeView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        VStack {
            Text("HomeView")
            Button {
                coordinator.push(.profileView)
            } label: {
                Text("Go to ProfileView")
            }

            Button {
                coordinator.pop()
            } label: {
                Text("PopThisScreen")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
