//
//  AuthViewModel.swift
//  EffectiveMobileTestApp
//
//  Created by MM on 14.03.2023.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isEmailValid: Bool = true
    @Published var isEmailTaken: Bool = false
    var coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func checkFieldInfo() -> Bool {
        if !firstName.isEmpty && !lastName.isEmpty && isEmailValid { return true }
        else { return false }    
    }
    
    func signIn() {
        guard !firstName.isEmpty && !lastName.isEmpty else {
            print("No name or surname have founded")
            return
        }
        print("pass empty field check")
        guard textFieldValidatorEmail(email) else {
            isEmailValid = false
            return
        }
        print("pass email validation")
        guard !coordinator.authManager.isEmailTaken(email: email) else {
            isEmailTaken = true
            print("email is taken = true")
            return
        }
        print("pass email istaken")
        coordinator.authManager.signIn(email: email, name: firstName, surname: lastName, password: firstName+lastName)
        coordinator.changeTab(.home)
    }
    
    func logIn() {
        guard coordinator.authManager.login(email: email, password: password)
        else { return }
        coordinator.authManager.setUserFromDatabase(email: email, password: password)
        coordinator.changeTab(.home)
    }

func textFieldValidatorEmail(_ string: String) -> Bool {
    if string.count > 100 {
        return false
    }
//    let emailFormat = "[A-Z0-9a-z._%+-]"+"@[A-Za-z0-9.-]"+".[A-Za-z]{2,64}"
    let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
    return emailPredicate.evaluate(with: string)
}
}
