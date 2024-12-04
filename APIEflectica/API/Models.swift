//
//  Models.swift
//  APIEflectica
//
//  Created by Анна on 02.12.2024.
//

import Foundation

struct User: Codable {
    let id: Int
    let username: String
    let bio: String
    let contact: String
    let portfolio: String
    let isAdmin: Bool
    let avatar: String
    let email: String
    let encryptedPassword: String

    enum CodingKeys: String, CodingKey {
        case id
        case username
        case bio
        case contact
        case portfolio
        case isAdmin = "is_admin"
        case avatar
        case email
        case encryptedPassword = "encrypted_password"
    }
}

struct Question: Codable {
    let id: Int
    let title: String
    let description: String
    let media: String?
    let userId: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case media
        case userId = "user_id"
    }
}

struct Effect: Codable {
    let id: Int
    let name: String
    let description: String
    let speed: Int
    let devices: String
    let manual: String
    let userId: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case speed
        case devices
        case manual
        case userId = "user_id"
    }
}

struct Collection: Codable {
    let id: Int
    let name: String
    let description: String
    let userId: Int

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case userId = "user_id"
    }
}

struct Comment: Codable {
    let id: Int
    let body: String
    let userId: Int
    let commentableId: Int
    let commentableType: String

    enum CodingKeys: String, CodingKey {
        case id
        case body
        case userId = "user_id"
        case commentableId = "commentable_id"
        case commentableType = "commentable_type"
    }
}

struct Favorite: Codable {
    let id: Int
    let userId: Int?
    let effectId: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case effectId = "effect_id"
    }
}
