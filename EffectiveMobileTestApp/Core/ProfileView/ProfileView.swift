//
//  ProfileView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    photoUploadView
                    profileRowsView
                }
            }
            .padding(.horizontal, 32)
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    private var photoUploadView: some View {
        VStack {
            Image("ProfilePhoto")
            
            Text("Change Photo")
                .font(.caption)
                .foregroundColor(Color.theme.middleGray)
            Text("Satria Adhi Pradana")
                .font(.mantserrat(.semibold, size: 18))
                .padding(.top, 16)
            Button {
                
            } label: {
                Text("Upload item")
                    .font(.mantserrat(.semibold, size: 16))
                    .frame(height: 40)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color.theme.fbBlue)
                    .cornerRadius(20)
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
        VStack(spacing: 24) {
            ProfileRow(image: "CardLogo", text: "Trade store", isChevron: true)
            ProfileRow(image: "CardLogo", text: "Payment method", isChevron: true)
            ProfileRow(image: "CardLogo", text: "Balance", isChevron: false)
                .overlay(alignment: .trailing) {
                    Text("$ 1593")
                        .font(.mantserrat(.medium, size: 17))
                }
            ProfileRow(image: "CardLogo", text: "Trade history", isChevron: true)
            ProfileRow(image: "RestoreLogo", text: "Restore Purchase", isChevron: true)
            ProfileRow(image: "QuestionLogo", text: "Help", isChevron: true)
            ProfileRow(image: "LogoutLogo", text: "Log out", isChevron: false)
                .onTapGesture {
                    coordinator.popToRoot()
                }
        }
    }
}
