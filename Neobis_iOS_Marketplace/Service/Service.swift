//
//  Service.swift
//  Neobis_iOS_Marketplace
//
//  Created by Фараби Иса on 19.06.2023.
//

import Foundation

class AuthService {
    static let shared = AuthService()
    private let baseURL = "http://35.234.124.146/auth/"
    
    func registerUser(with registerRequest: Register, completion: @escaping (Result<Register, Error>) -> Void) {
        let urlString = "\(baseURL)register/"
        guard let url = URL(string: urlString) else { return }
        
        guard let jsonData = try? JSONEncoder().encode(registerRequest) else {
            print("Failed to encode register data.")
            completion(.failure(NSError(domain: "AuthService", code: 0, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                print("Data error")
                completion(.failure(NSError(domain: "AuthService", code: 0, userInfo: nil)))
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let user = try decoder.decode(Register.self, from: data)
                completion(.success(user))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func login(with loginRequest: Login, completion: @escaping (Result<Login, Error>) -> Void) {
        let urlString = "\(baseURL)login/"
        guard let url = URL(string: urlString) else { return }
        
        guard let jsonData = try? JSONEncoder().encode(loginRequest) else {
            print("Failed to encode register data.")
            completion(.failure(NSError(domain: "AuthService", code: 0, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                print("Data error")
                completion(.failure(NSError(domain: "AuthService", code: 0, userInfo: nil)))
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let user = try decoder.decode(Login.self, from: data)
                completion(.success(user))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
