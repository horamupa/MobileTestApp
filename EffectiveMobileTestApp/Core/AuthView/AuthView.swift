//
//  AuthView.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

struct AuthView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject var vm: AuthViewModel = AuthViewModel()
    @State var isNeedLogin: Bool = false
    @State var isShowPassword: Bool = false
    @State var isUserExist: Bool = false
    var authManager = AuthService.shared
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            if !isNeedLogin {
                SignInView
            } else {
                LoginView
            }
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(authManager: AuthService.shared)
    }
}

extension AuthView {
    
    private var SignInLogIn: some View {
        VStack(alignment: .leading) {
            Button {
                if !vm.firstName.isEmpty && !vm.lastName.isEmpty &&  vm.isEmailValid {
                    if AuthService.shared.signIn(email: vm.email, password: vm.firstName+vm.lastName) {
                        coordinator.authManager.setUser(email: vm.email, password: vm.firstName+vm.lastName)
                        coordinator.dismissFullScreenCover()
                        }
                } else {
                    if AuthService.shared.checkName(email: vm.email) {
                        isUserExist = true
                    }
                }
            } label: {
                ButtonView(text: "Sign in")
        }
            HStack {
                Text("Already have an account?")
                    .foregroundColor(Color.theme.middleGray)
                Button {
                    isNeedLogin.toggle()
                } label: {
                    Text("Log in")
                }
                Spacer()
            }
            .font(.mantserrat(.medium, size: 10))
            .frame(maxWidth: .infinity)
        }
    }
    
    
    private var LogInWithAppleGoogle: some View {
        VStack(spacing: 24) {
            Button {
                
            } label: {
                HStack(spacing: 10) {
                    Image("GoogleLogo")
                    Text("Sign in with Google")
                        .font(.mantserrat(.medium, size: 12))
                }
            }

            Button {
            } label: {
                HStack(spacing: 10) {
                    Image("AppleLogo")
                        .padding(.trailing, 4)
                    Text("Sign in with Apple")
                        .font(.mantserrat(.medium, size: 12))
                }
            }

        }
        .foregroundColor(Color.black)
        .font(.mantserrat(.regular, size: 16))
        .padding(.top, 40)
    }
    
    
    private var SignInView: some View {
        VStack(spacing: 35) {
            Text("Sign In")
                .font(.mantserrat(.semibold, size:  25))
                .padding(.bottom, 40)
            
            TextField("First name", text: $vm.firstName)
                .authFieldView("First name")
            TextField("Last name", text: $vm.lastName)
                .authFieldView("Last name")
            TextField("Email", text: $vm.email, onEditingChanged: { isChanged in
                if !isChanged {
                    if vm.textFieldValidatorEmail(vm.email) {
                        vm.isEmailValid = true
                    } else {
                        vm.isEmailValid = false
                    }
                }
            })
                .authFieldView("Email")
                .overlay(content: {
                    if !vm.isEmailValid {
                        Capsule()
                            .stroke(.red ,lineWidth: vm.isEmailValid ? 0 : 2)
                    }
                    if isUserExist {
                        Text("Email already taken")
                            .font(.subheadline)
                            .foregroundColor(.red)
                            .offset(y: 26)
                    }
                })

            SignInLogIn
            
            LogInWithAppleGoogle
        }
        .padding(.horizontal, 32)
    }
    
    
    private var LoginView: some View {
        VStack(spacing: 35) {
            Text("Welcome back")
                .font(.mantserrat(.semibold, size:  25))
                .padding(.bottom, 40)
            
            TextField("First name", text: $vm.firstName)
                .authFieldView("First name")
            Group {
                if isShowPassword {
                    TextField("Password", text: $vm.password)
                        .authFieldView("Password")
                } else {
                    SecureField("Password", text: $vm.password)
                        .authFieldView("Password")
                }
            }
                    .overlay(alignment: .trailing) {
                        Button {
                            isShowPassword.toggle()
                        } label: {
                            Image("EyeLogo")
                                .padding(.trailing)
                        }
                    }
            
            logInButton
                .padding(.top, 32)
            
            Button {
                isNeedLogin.toggle()
            } label: {
                Text("Back to sign in")
                    .font(.mantserrat(.regular, size:  14))
                    .foregroundColor(Color.theme.middleGray)
                    .padding(.bottom, 16)
            }

            
            
        }
        .padding(.horizontal, 32)
    }
    
    
    private var logInButton: some View {
        Button {
            if coordinator.authManager.login(email: vm.email, password: vm.password) {
                coordinator.authManager.setUser(email: vm.email, password: vm.password)
            }
        } label: {
            ButtonView(text: "Log in")
        }
    }
}

/*
Button {
    coordinator.push(.homeView)
} label: {
    Text("Go to TabBarView")
}

Button {
    coordinator.sheet(.sheetView)
} label: {
    Text("Go to SheetView")
}

Button {
    coordinator.fullScreenCover(.TabBarView)
} label: {
    Text("Go to FullScreen TabBar")
}
 */

