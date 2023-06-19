//
//  Login .swift
//  Neobis_iOS_Marketplace
//
//  Created by Фараби Иса on 20.06.2023.
//

import Foundation

// MARK: - Login
struct Login: Codable {
    var username: String?
    var password: String?
    var tokens: Tokens?
    var detail: String?
}

// MARK: - Tokens
struct Tokens: Codable {
    var refresh, access: String?
}
