//
//  SheetView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

struct SheetView: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        VStack {
            Text("SheetView")
            Button {
                coordinator.dismissSheet()
            } label: {
                Text("DismissSheet")
            }

        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
