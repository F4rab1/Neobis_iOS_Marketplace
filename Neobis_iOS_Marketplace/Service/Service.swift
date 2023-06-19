//
//  Service.swift
//  Neobis_iOS_Marketplace
//
//  Created by Фараби Иса on 19.06.2023.
//

import Foundation

class AuthService {
    static let shared = AuthService()
    private let baseURL = URL(string: "http://35.234.124.146/auth/register/")!

    func registerUser() {
        var request = URLRequest(url: baseURL)
        
        let registerData = Register(username: "example2",
                                    email: "viton60455@anwarb.com",
                                    password: "farabi2004",
                                    password2: "farabi2004")
        
        guard let jsonData = try? JSONEncoder().encode(registerData) else {
            print("Failed to encode register data.")
            return
        }
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
            
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                print("data error")
                return
            }
        
            let decoder = JSONDecoder()
            do {
                let user = try decoder.decode(Register.self, from: data)
                print(user)
            } catch {
                let error = NSError(domain: "AuthService", code: 0, userInfo: nil)
                print(error)
            }
        }.resume()
    }
}
