//
//  HomeView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var coordinator: HomeCoordinator
    @State var searchText: String = ""
    @State private var selectedOptions: ShopFilterOptions = .mobile
    @State  var tabSelection: TabBarItem = .home
    var latestGrid: [GridItem] = [.init(.flexible())]
    var saleGrid: [GridItem] = [.init(.flexible())]
    
    private var isCustomNavBar: Bool { tabSelection == .home ? true : false }
    var body: some View {
        ScrollView {
            VStack {
                searchView
                filtersView
                latestView
                flashSaleView
                brandsView
                /*
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
                 */
            }
            .padding(.horizontal, 8)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
       
    }
}

extension HomeView {
    private var searchView: some View {
        TextField("", text: $searchText)
            .placeholderCenter(when: searchText.isEmpty, placeholder: {
                Text("What are you looking for?").foregroundColor(Color.theme.middleGray).tracking(-0.5)
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
                LazyHGrid(rows: latestGrid) {
                    ForEach(0..<10) {_ in
                        LatestView()
                            .onTapGesture {
                                coordinator.push(.productView)
                            }
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
                LazyHGrid(rows: saleGrid) {
                    ForEach(0..<10) {_ in
                        RoundedRectangle(cornerRadius: 20)
                            .stroke()
                            .frame(width: UIScreen.main.bounds.width / 2 - 14)
                    }
                }
            }
            .frame(height: 221)
        }
    }
    
    private var brandsView: some View {
        VStack(spacing: 8) {
            HStack {
                Text("Brands")
                    .font(.mantserrat(.semibold, size: 16))
                Spacer()
                Text("View all")
                    .font(.mantserrat(.regular, size: 13))
                    .foregroundColor(Color.theme.middleGray)
            }
            .padding(.top, 8)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: latestGrid) {
                    ForEach(0..<10) {_ in
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(style: .init(lineWidth: 2))
                        LatestView()
                    }
                }
            }
            .frame(height: 149)
        }
    }
}
