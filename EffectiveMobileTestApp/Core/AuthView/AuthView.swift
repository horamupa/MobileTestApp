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
    @State var isShowPassword: Bool = true
    @State var isEmailValid: Bool = true
    @State var isUserExist: Bool = false
    
    var body: some View {
        if !isNeedLogin {
            SignInView
        } else {
            LoginView
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

extension AuthView {
    private var SignInLogIn: some View {
        VStack(alignment: .leading) {
            Button {
                if !vm.firstName.isEmpty && !vm.lastName.isEmpty &&  isEmailValid {
                    if AuthService.shared.signIn(email: vm.email, password: vm.firstName+vm.lastName) {
                        coordinator.push(.homeView)
                        }
                } else {
                    if AuthService.shared.checkName(email: vm.email) {
                        isUserExist = true
                    }
                }
            } label: {
                Text("Sign in")
                    .font(.mantserrat(.semibold, size: 18))
                    .frame(height: 46)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background {
                        Color.theme.fbBlue
                    }
                    .cornerRadius(20)
        }
            HStack {
                Text("Already have an account?")
                    .foregroundColor(Color.gray)
                Button {
                    isNeedLogin.toggle()
                } label: {
                    Text("Log in")
                }
                Spacer()
            }
            .font(.subheadline)
            .frame(maxWidth: .infinity)
        }
    }
    
    private var LogInWithAppleGoogle: some View {
        VStack(spacing: 24) {
            Button {
                
            } label: {
                HStack {
                    Image("GoogleLogo")
                    Text("Sign in with Google")
                        .frame(width: 180)
                }
            }

            Button {
            } label: {
                HStack {
                    Image("AppleLogo")
                    Text("Sign in with Apple")
                        .frame(width: 180)
                }
            }

        }
        .font(.mantserrat(.regular, size: 16))
        .padding(.top, 32)
    }
    
    private var SignInView: some View {
        VStack(spacing: 24) {
            Text("Sign In")
                .font(.mantserrat(.semibold, size:  24))
                .padding(.bottom, 16)
            
            TextField("First name", text: $vm.firstName)
                .authFieldView("First name")
            TextField("Last name", text: $vm.lastName)
                .authFieldView("Last name")
            TextField("Email", text: $vm.email, onEditingChanged: { isChanged in
                if !isChanged {
                    if self.textFieldValidatorEmail(vm.email) {
                        self.isEmailValid = true
                    } else {
                        self.isEmailValid = false
                        self.vm.email = ""
                    }
                }
            })
                .authFieldView("Email")
                .overlay(content: {
                    if !isEmailValid {
                        Capsule()
                            .stroke(.red ,lineWidth: isEmailValid ? 0 : 2)
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
        VStack(spacing: 24) {
            Text("Log In")
                .font(.mantserrat(.semibold, size:  24))
                .padding(.bottom, 16)
            
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
        }
        .padding(.horizontal, 32)
    }
    
    private var logInButton: some View {
        Button {
            if AuthService.shared.login(email: vm.email, password: vm.password) {
                coordinator.push(.homeView)
            }
        } label: {
            Text("Log in")
                .font(.mantserrat(.semibold, size: 18))
                .frame(height: 46)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background {
                    Color.theme.fbBlue
                }
                .cornerRadius(20)
        }
    }
    
    func textFieldValidatorEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "[A-Z0-9a-z._%+-]"+"@[A-Za-z0-9.-]"+"\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
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

