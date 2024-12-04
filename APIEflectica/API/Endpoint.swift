//
//  Endpoint.swift
//  APIEflectica
//
//  Created by Анна on 02.12.2024.
//

import Foundation

protocol Endpoint {
    var compositePath: String { get }
    var headers: [String: String] { get }
    var parameters: [String: String]? { get }
}

extension Endpoint {
    var parameters: [String: String]? {
        return nil
    }
}

enum EntityEndpoint: Endpoint {
    case users(page: Int)
    case questions(page: Int, userId: Int?)
    case effects(page: Int, category: String?)
    case collections(page: Int)
    case favorites(page: Int, userId: Int?)
    case comments(page: Int, commentableId: Int, commentableType: String)

    var compositePath: String {
        switch self {
        case .users:
            return "/api/v1/users"
        case .questions:
            return "/api/v1/questions"
        case .effects:
            return "/api/v1/effects"
        case .collections:
            return "/api/v1/collections"
        case .favorites:
            return "/api/v1/favorites"
        case .comments:
            return "/api/v1/comments"
        }
    }

    var parameters: [String: String]? {
        switch self {
        case .users(let page):
            return ["page": "\(page)"]
        case .questions(let page, let userId):
            var params = ["page": "\(page)"]
            if let userId = userId {
                params["userId"] = "\(userId)"
            }
            return params
        case .effects(let page, let category):
            var params = ["page": "\(page)"]
            if let category = category {
                params["category"] = category
            }
            return params
        case .collections(let page):
            return ["page": "\(page)"]
        case .favorites(let page, let userId):
            var params = ["page": "\(page)"]
            if let userId = userId {
                params["userId"] = "\(userId)"
            }
            return params
        case .comments(let page, let commentableId, let commentableType):
            return [
                "page": "\(page)",
                "commentableId": "\(commentableId)",
                "commentableType": commentableType
            ]
        }
    }

    var headers: [String: String] {
        return ["Content-Type": "application/json"]
    }
}
