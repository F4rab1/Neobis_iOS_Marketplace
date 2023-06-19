//
//  LoginViewModel .swift
//  Neobis_iOS_Marketplace
//
//  Created by Фараби Иса on 20.06.2023.
//

import Foundation

protocol LoginViewModelProtocol {
    func login(username: String, password: String)
}

class LoginViewModel: LoginViewModelProtocol {
    func login(username: String, password: String) {
        let authService = AuthService.shared
        
        let registerRequest = Login(username: username,
                                    password: password)
        
        authService.login(with: registerRequest) { result in
            switch result {
            case .success(let response):
                print("Registration successful: \(response.username)")
                print("Registration successful: \(response.tokens)")
                print("\(response.detail)")
            case .failure(let error):
                print("Registration failed: \(error)")
            }
        }
    }
}
