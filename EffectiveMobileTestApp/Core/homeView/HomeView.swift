//
//  HomeView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @State var searchText: String = ""
    @State private var selectedOptions: ShopFilterOptions = .mobile
    @Binding var tabSelection: TabBarItem
    var saleGrid: [GridItem] = [GridItem(.fixed(100))]
    
    private var isCustomNavBar: Bool { tabSelection == .home ? true : false }
    var body: some View {
        VStack {
            searchView
            filtersView
            latestView
            flashSaleView
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
            Color.red
        }
        .padding(.horizontal, 8)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if isCustomNavBar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("MenuLogoSmall")
                }
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Trade by")
                        Text("Bata")
                            .foregroundColor(Color.theme.fbBlue)
                    }
                    .font(.mantserrat(.bold, size: 24))
                    .padding(.top, 6)
                    
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    VStack {
                        Image("ProfilePhoto")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 24)
                        HStack(spacing: 2) {
                            Text("Location")
                            Image(systemName: "chevron.down")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 5)
                        }
                        .font(.mantserrat(.regular, size: 13))
                    }
                    
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView(tabSelection: .constant(.home))
        }
       
    }
}

extension HomeView {
    private var searchView: some View {
        TextField("", text: $searchText)
            .placeholderCenter(when: searchText.isEmpty, placeholder: {
                Text("What are you looking for?").foregroundColor(Color.theme.middleGray)
            })
            .padding(.vertical, 4)
            .background(Color.theme.lightGray2)
            .cornerRadius(20)
            .overlay(alignment: .trailing) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.theme.middleGray)
                    .padding(.trailing, 10)
            }
            .padding(.horizontal, 40)
            .padding(.top, 10)
            .font(.mantserrat(.regular, size: 14))
            .multilineTextAlignment(.center)

    }
    
    private var filtersView: some View {
        ShopFilterView(selectedOption: $selectedOptions)
            .padding(.top, 10)
    }
    
    private var latestView: some View {
        VStack(spacing: 8) {
            HStack {
                Text("Latest")
                    .font(.mantserrat(.semibold, size: 16))
                Spacer()
                Text("View all")
                    .font(.mantserrat(.regular, size: 13))
                    .foregroundColor(Color.theme.middleGray)
            }
            .padding(.top, 8)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(0..<10) {_ in
                        RoundedRectangle(cornerRadius: 20)
                            .stroke()
                            .frame(width: 114)
                            .padding(1)
                    }
                }
            }
            .frame(height: 149)
        }
    }
    
    private var flashSaleView: some View {
        VStack(spacing: 8) {
            HStack {
                Text("Flash sale")
                    .font(.mantserrat(.semibold, size: 16))
                Spacer()
                Text("View all")
                    .font(.mantserrat(.regular, size: 13))
                    .foregroundColor(Color.theme.middleGray)
            }
            .padding(.top, 8)
            ScrollView(.horizontal, showsIndicators: false) {
//                LazyHStack {
                LazyHGrid(rows: saleGrid) {
                    ForEach(0..<10) {_ in
                        RoundedRectangle(cornerRadius: 20)
                            .stroke()
//                            .frame(width: 114)
//                            .padding(1)
                    }
                }
            }
            .frame(height: 149)
        }
    }
}
