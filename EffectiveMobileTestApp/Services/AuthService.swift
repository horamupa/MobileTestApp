//
//  AuthService.swift
//  game4Two
//
//  Created by MM on 25.07.2022.
//

import SwiftUI

class AuthService {
    
    var users: [User] = []
    var user: User?
    
    static let shared = AuthService()
    
    private init() {
        getUsers()
    }
   
    
    func login(email: String, password: String) -> Bool {
        users.contains { user in
            user == User(user: email, password: password)
        }
    }

    func signIn(email: String, password: String) -> Bool {
        users.append(User(user: email, password: password))
        saveUsers()
        return true
    }
    
    func checkName(email: String) -> Bool {
        users.contains { user in
            user.user == email
        }
    }
    
    func saveUsers() {
        if let encodedData = try? JSONEncoder().encode(users) {
            UserDefaults.standard.set(encodedData, forKey: "users")
        }
    }
    
    func getUsers() {
        guard
        let data = UserDefaults.standard.data(forKey: "users"),
        let savedData = try? JSONDecoder().decode([User].self, from: data)
        else {
            print("No users yet or bad decoding")
            return
        }
        self.users = savedData
    }
}