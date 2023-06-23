//
//  PasswordViewModel.swift
//  Neobis_iOS_Marketplace
//
//  Created by Фараби Иса on 24.06.2023.
//

import Foundation

protocol PasswordViewModelProtocol {
    func registerUser(username: String, email: String, password: String, confirmPassword: String)
}

class PasswordViewModel: PasswordViewModelProtocol {
    func registerUser(username: String, email: String, password: String, confirmPassword: String) {
        let authService = AuthService.shared
        
        let registerRequest = Register(username: username,
                                       email: email,
                                       password: password,
                                       password2: confirmPassword)
        
        authService.registerUser(with: registerRequest) { result in
            switch result {
            case .success(let response):
                print("Registration successful: \(response.username)")
                print("Registration successful: \(response.email)")
            case .failure(let error):
                print("Registration failed: \(error)")
            }
        }
    }
}
