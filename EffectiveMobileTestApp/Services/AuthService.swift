//
//  AuthService.swift
//  game4Two
//
//  Created by MM on 25.07.2022.
//

import SwiftUI
import Combine

class AuthService: ObservableObject {
    
    var users: [User] = []
    @Published var user: User? = nil
    @Published var isUserNil: Bool = true
    private var cancellables = Set<AnyCancellable>()
    
    static let shared = AuthService()
    
    init() {
        getUsers()
        $user
            .map{data -> Bool in
                data == nil
            }
            .sink { value in
                self.isUserNil = value
            }
            .store(in: &cancellables)
    }
   
    func setUser(email: String, name: String, surname: String, password: String) {
        user = User(email: email, name: name, surname: surname, password: password)
    }
    
    func login(email: String, password: String) -> Bool {
        users.contains { user in
            user == User(email: email, password: password)
        }
    }

    func signIn(email: String, name: String, surname: String, password: String) {
        users.append(User(email: email, name: name, surname: surname, password: password))
        setUser(email: email, name: name, surname: surname, password: password)
        saveUsers()
    }
    
    func checkName(email: String) -> Bool {
        users.contains { user in
            user.email == email
        }
    }
    
    func checkUserInDatabase(email: String, password: String) {
        let foundUser = users.first { user in
            user.email == email && user.password == password
        }
        user = foundUser
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
    
    func logOff() {
        user = nil
    }
}
