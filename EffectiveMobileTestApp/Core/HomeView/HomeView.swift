//
//  HomeView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var coordinator: HomeCoordinator
    @StateObject var vm: HomeViewModel
    @State  var tabSelection: TabBarItem = .home
    var latestGrid: [GridItem] = [.init(.flexible())]
    var saleGrid: [GridItem] = [.init(.flexible())]
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            ScrollView {
                ZStack(alignment: .top) {
                    VStack(spacing: 10) {
                        searchView
                        filtersView
                        if vm.isAllDataFetched {
                            latestView
                            flashSaleView
                            brandsView
                        } else {
                            ProgressView()
                        }
                    }
                    if vm.searchText != "" {
                       searchHintSection
                    }
                }
            }
                .padding(.horizontal, 8)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Image("MenuLogoSmall")
                        }
                        ToolbarItem(placement: .principal) {
                            HStack {
                                Text("Trade by")
                                Text("Bata")
                                    .foregroundColor(Color.theme.fbBlue)
                            }
                            .font(.mantserrat(.bold, size: 19))
                            
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            VStack {
                                Image("ProfilePhoto")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 24)
                                HStack(spacing: 2) {
                                    Text("Location")
                                        .foregroundColor(Color.theme.darkGray)
                                        .font(.mantserrat(.medium, size: 10))
                                    Image(systemName: "chevron.down")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 5)
                                        .foregroundColor(Color.black)
                                }
                            }
                            .offset(y: 5)
                        }
                    }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView(vm: .init(dataManager: dev.coordinator.dataManager))
        }
    }
}

extension HomeView {
    private var searchView: some View {
        VStack {
            TextField("", text: $vm.searchText)
                .placeholderCenter(when: vm.searchText.isEmpty, placeholder: {
                    Text("What are you looking for?").font(.mantserrat(.medium, size: 9)).foregroundColor(Color.theme.middleGray).tracking(-0.5)
                })
                .autocorrectionDisabled()
                .padding(.vertical, 4)
                .background(Color.theme.lightGray2)
                .cornerRadius(20)
                .overlay(alignment: .trailing) {
                    Image("SearchLogo")
                        .foregroundColor(Color.theme.middleGray)
                        .padding(.trailing, 10)
                }
                .overlay(alignment: .leading, content: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color.theme.middleGray)
                        .padding(.leading, 10)
                        .opacity(vm.searchText.isEmpty ? 0 : 1)
                        .onTapGesture {
                            vm.searchText = ""
                        }
                })
                .padding(.horizontal, 40)
                .padding(.top, 10)
                .multilineTextAlignment(.center)
        }

    }
    
    private var filtersView: some View {
        ShopFilterView(selectedOption: $vm.selectedOptions, vm: vm)
            .padding(.top, 10)
    }
    
    private var latestView: some View {
        VStack(spacing: 0) {
            if (vm.isSelectedOption != nil && vm.latestFiltred.isEmpty) {
                EmptyView()
            } else {
                HStack {
                    Text("Latest")
                        .font(.mantserrat(.semibold, size: 16))
                    Spacer()
                    Text("View all")
                        .font(.mantserrat(.medium, size: 9))
                        .foregroundColor(Color.theme.middleGray)
                }
                .padding(.top, 8)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: latestGrid, spacing: 12) {
                        ForEach(vm.isSelectedOption != nil ? vm.latestFiltred : vm.latest) { item in
                            LatestView(model: item)
                                .onTapGesture {
                                    coordinator.push(.productView)
                                }
                        }
                    }
            }
                .frame(height: 149)
        }
        }
    }
    
    private var flashSaleView: some View {
        VStack(spacing: 0) {
            
            if (vm.isSelectedOption != nil && vm.saleFiltred.isEmpty) {
//                        SalesEmptyView()
                EmptyView()
            } else {
                HStack {
                    Text("Flash sale")
                        .font(.mantserrat(.semibold, size: 16))
                    Spacer()
                    Text("View all")
                        .font(.mantserrat(.medium, size: 9))
                        .foregroundColor(Color.theme.middleGray)
                }
                .padding(.top, 8)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: saleGrid) {
                    
                        ForEach(vm.isSelectedOption != nil ? vm.saleFiltred : vm.flashSale) { item in
                            Button {
                                coordinator.push(.productView)
                            } label: {
                                SalesView(model: item)
                            }
                        }
                    }
                }
            .frame(height: 221)
            }
        }
    }
    
    private var brandsView: some View {
        VStack(spacing: 0) {
            if vm.isSelectedOption == nil {
                HStack {
                    Text("Brands")
                        .font(.mantserrat(.semibold, size: 16))
                    Spacer()
                    Text("View all")
                        .font(.mantserrat(.medium, size: 9))
                        .foregroundColor(Color.theme.middleGray)
                }
                .padding(.top, 8)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: latestGrid) {
                        ForEach(vm.latest) { item in
                            LatestView(model: item)
                                .onTapGesture {
                                    coordinator.push(.productView)
                                }
                        }
                    }
                }
                .frame(height: 149)
            }
        }
        .padding(.bottom, 70)
    }
    
    private var searchHintSection: some View {
        VStack(spacing: 0) {
            ForEach(vm.searchHint, id: \.self) { hint in
                SearchHintView(text: hint)
                    .padding(.vertical, 4)
                    .frame(maxWidth: .infinity)
                    .background(Color.theme.lightGray2)
                    .cornerRadius(10)
                    .padding(.horizontal, 60)
                    .onTapGesture {
                        vm.searchText = hint
                    }
            }
        }
        .padding(.top, 40)
    }
}
