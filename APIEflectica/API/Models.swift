//
//  Models.swift
//  APIEflectica
//
//  Created by Анна on 02.12.2024.
//

import Foundation

struct User: Codable {
    let id: Int
    let email: String
    let username: String
    let bio: String
    let contact: String
    let portfolio: String
    let isAdmin: Bool
    let avatar: String
    let encryptedPassword: String
    var favorites: [Effect]

    enum CodingKeys: String, CodingKey {
        case id
        case email
        case username
        case bio
        case contact
        case portfolio
        case isAdmin = "is_admin"
        case avatar
        case encryptedPassword = "encrypted_password"
        case favorites
    }
}

struct Question: Codable {
    let id: Int
    let title: String
    let description: String
    let media: String?
    let tagList: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case media
        case tagList = "tag_list"
    }
}

struct Effect: Codable, Identifiable {
    let id: Int
    let name: String
    let img: ImageURLs
    let description: String
    let speed: Int
    let devices: String
    let manual: String
    let tagList: [String]
    let programs: String
    let comments: [Comment]?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case img
        case description
        case speed
        case devices
        case manual
        case tagList = "tag_list"
        case programs
        case comments
    }
}

struct ImageURLs: Codable {
    let url: String
    let q70: QualityImage?

    enum CodingKeys: String, CodingKey {
        case url
        case q70
    }
}

struct QualityImage: Codable {
    let url: String
}

struct Collection: Codable {
    let id: Int
    let name: String
    let description: String
    let userId: Int
    let tagList: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case userId = "user_id"
        case tagList = "tag_list"
    }
}

struct Comment: Codable, Identifiable {
    var id: Int
    let body: String
    let createdAt: String
    let user: User

    enum CodingKeys: String, CodingKey {
        case id
        case body
        case createdAt = "created_at"
        case user
    }
}

struct Favorite: Identifiable, Codable {
    let id: Int
    let name: String
    let img: ImageDetails
    let description: String
    let speed: Int
    let devices: String
    let manual: String
    let url: String
    
    struct ImageDetails: Codable {
        let url: String
        let q70: ImageURL
    }
    
    struct ImageURL: Codable {
        let url: String
    }
}
