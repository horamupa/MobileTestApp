//
//  ProfileView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI
import Combine

struct ProfileView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject var vm: ProfileViewModel
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            ScrollView {
                    VStack(spacing: 16) {
                        photoUploadView
                        profileRowsView
                    }
                }
                .padding(.horizontal, 32)
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
                .scrollIndicators(.hidden)
        }
        .fullScreenCover(isPresented: $vm.isImagePicker, content: {
            SUImagePickerView(image: $vm.profileImage, isPresented: $vm.isImagePicker)
        })
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        coordinator.tabSelection = .home
                    } label: {
                        Image(systemName: "arrow.left")
                            .bold()
                            .foregroundColor(Color.black)
                    }
                }
            }
//        }
            
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView(vm: .init(userProfile: dev.coordinator.userManager))
                .environmentObject(dev.coordinator)
        }
    }
}

extension ProfileView {
    private var photoUploadView: some View {
        VStack {
            if let image = vm.profileImage {
                Image(uiImage: image)
                    .resizable()
                   .scaledToFill()
                   .clipShape(Circle())
                   .frame(width: 60, height: 60)
            } else {
                Image("ProfilePhoto")
            }
            Button {
                vm.isImagePicker.toggle()
            } label: {
                Text("Change Photo")
                    .font(.mantserrat(.regular, size: 8))
                    .foregroundColor(Color.theme.middleGray)
            }

            Text("Satria Adhi Pradana")
                .font(.mantserrat(.semibold, size: 16))
                .foregroundColor(Color.theme.darkGray)
                .padding(.top, 16)
            Button {
                
            } label: {
                Text("Upload item")
                    .font(.mantserrat(.semibold, size: 16))
                    .frame(height: 40)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color.theme.fbBlue)
                    .cornerRadius(15)
                    .overlay(alignment: .leading) {
                        Image("UploadLogo")
                            .frame(height: 18)
                            .padding(.leading, 50)
                    }
                    .padding(.top, 24)
            }
        }
    }
    
    private var profileRowsView: some View {
        VStack(spacing: 20) {
            ProfileRow(image: "CardLogo", text: "Trade store", isChevron: true)
            ProfileRow(image: "CardLogo", text: "Payment method", isChevron: true)
            ProfileRow(image: "CardLogo", text: "Balance", isChevron: false)
                .overlay(alignment: .trailing) {
                    Text("$ 1593")
                        .font(.mantserrat(.medium, size: 14))
                }
            ProfileRow(image: "CardLogo", text: "Trade history", isChevron: true)
            ProfileRow(image: "RestoreLogo", text: "Restore Purchase", isChevron: true)
            ProfileRow(image: "QuestionLogo", text: "Help", isChevron: true)
            Button {
                coordinator.authManager.logOff()
            } label: {
                ProfileRow(image: "LogoutLogo", text: "Log out", isChevron: false)
                    .foregroundColor(.black)
            }
        }
        .padding(.bottom, 70)
    }
    
    private var backChevron: some View {
        Button {
            
        } label: {
            Image(systemName: "chevron.left")
                .bold()
                .foregroundColor(.black)
        }
    }
}
