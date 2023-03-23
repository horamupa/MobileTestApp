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
    
//    func checkInformation() -> Bool {
//        if 
//    }
    
    func textFieldValidatorEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "[A-Z0-9a-z._%+-]"+"@[A-Za-z0-9.-]"+"\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
}
