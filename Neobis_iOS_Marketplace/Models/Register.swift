//
//  Register.swift
//  Neobis_iOS_Marketplace
//
//  Created by Фараби Иса on 19.06.2023.
//

import Foundation

struct Register: Codable {
    let username: String
    let email: String
    var password: String?
    var password2: String?
}

struct RegisterResponse: Codable {
    var username: [String]?
    var email: [String]?
}
