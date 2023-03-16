//
//  CustomNavBarView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 16.03.2023.
//

import SwiftUI

struct CustomNavBarView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Color.green
                NavigationLink(destination: Text("Destination").navigationTitle("Title2" )) {
                    Text("Navigation")
                    
                }
            }
            .navigationTitle("NavBarView")
            .ignoresSafeArea()
        }
    }
}

struct CustomNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarView()
    }
}
