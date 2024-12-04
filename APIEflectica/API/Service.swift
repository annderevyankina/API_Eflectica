//
//  Service.swift
//  APIEflectica
//
//  Created by Анна on 02.12.2024.
//

import Foundation

final class ApiService {
    let worker = BaseURLNetworking(baseURL: "http://localhost:3000")
    let decoder = JSONDecoder()
    
    // Функция для получения коллекций
    func fetchCollections(
        page: Int,
        completion: @escaping (Result<[Collection], Error>) -> Void
    ) {
        let endpoint = EntityEndpoint.collections(page: page)
        let request = Request(endpoint: endpoint)
        
        worker.execute(request: request) { response in
            switch response {
            case .success(let serverResponse):
                guard let data = serverResponse.data else {
                    completion(.failure(Networking.Error.emptyData))
                    return
                }
                
                do {
                    let collections = try self.decoder.decode([Collection].self, from: data)
                    completion(.success(collections))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // Функция для получения эффектов
    func fetchEffects(
        page: Int,
        category: String?,
        completion: @escaping (Result<[Effect], Error>) -> Void
    ) {
        let endpoint = EntityEndpoint.effects(page: page, category: category)
        let request = Request(endpoint: endpoint)
        
        worker.execute(request: request) { response in
            switch response {
            case .success(let serverResponse):
                guard let data = serverResponse.data else {
                    completion(.failure(Networking.Error.emptyData))
                    return
                }
                
                do {
                    let effects = try self.decoder.decode([Effect].self, from: data)
                    completion(.success(effects))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // Функция для получения вопросов
    func fetchQuestions(
        page: Int,
        userId: Int?,
        completion: @escaping (Result<[Question], Error>) -> Void
    ) {
        let endpoint = EntityEndpoint.questions(page: page, userId: userId)
        let request = Request(endpoint: endpoint)
        
        worker.execute(request: request) { response in
            switch response {
            case .success(let serverResponse):
                guard let data = serverResponse.data else {
                    completion(.failure(Networking.Error.emptyData))
                    return
                }
                
                do {
                    let questions = try self.decoder.decode([Question].self, from: data)
                    completion(.success(questions))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // Функция для получения пользователей
    func fetchUsers(
        page: Int,
        completion: @escaping (Result<[User], Error>) -> Void
    ) {
        let endpoint = EntityEndpoint.users(page: page)
        let request = Request(endpoint: endpoint)
        
        worker.execute(request: request) { response in
            switch response {
            case .success(let serverResponse):
                guard let data = serverResponse.data else {
                    completion(.failure(Networking.Error.emptyData))
                    return
                }
                
                do {
                    let users = try self.decoder.decode([User].self, from: data)
                    completion(.success(users))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // Функция для получения избранных
    func fetchFavorites(
        page: Int,
        userId: Int?,
        completion: @escaping (Result<[Favorite], Error>) -> Void
    ) {
        let endpoint = EntityEndpoint.favorites(page: page, userId: userId)
        let request = Request(endpoint: endpoint)
        
        worker.execute(request: request) { response in
            switch response {
            case .success(let serverResponse):
                guard let data = serverResponse.data else {
                    completion(.failure(Networking.Error.emptyData))
                    return
                }
                
                do {
                    let favorites = try self.decoder.decode([Favorite].self, from: data)
                    completion(.success(favorites))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // Функция для получения комментариев
    func fetchComments(
        page: Int,
        commentableId: Int,
        commentableType: String,
        completion: @escaping (Result<[Comment], Error>) -> Void
    ) {
        let endpoint = EntityEndpoint.comments(page: page, commentableId: commentableId, commentableType: commentableType)
        let request = Request(endpoint: endpoint)
        
        worker.execute(request: request) { response in
            switch response {
            case .success(let serverResponse):
                guard let data = serverResponse.data else {
                    completion(.failure(Networking.Error.emptyData))
                    return
                }
                
                do {
                    let comments = try self.decoder.decode([Comment].self, from: data)
                    completion(.success(comments))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
