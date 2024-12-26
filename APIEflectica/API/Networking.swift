//
//  Networking.swift
//  APIEflectica
//
//  Created by Анна on 02.12.2024.
//

import Foundation

protocol NetworkingLogic {
    typealias Response = ((_ response: Result<Networking.ServerResponse, Error>) -> Void)
    
    func execute(request: Request, completion: @escaping Response)
}

enum Networking {
    struct ServerResponse {
        var data: Data?
        var response: URLResponse?
    }
    
    enum Error: Swift.Error {
        case emptyData
        case invalidRequest
        case decodingError
    }
}

final class BaseURLNetworking: NetworkingLogic {
    var baseURL: String
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func execute(request: Request, completion: @escaping Response) {
        guard let urlRequest = convert(request) else {
            completion(.failure(Networking.Error.invalidRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            guard let data = data else {
                print("Error: No data received") 
                completion(.failure(Networking.Error.emptyData))
                return
            }

            completion(.success(.init(data: data, response: response)))
        }
        
        task.resume()
    }

    private func convert(_ request: Request) -> URLRequest? {
        guard let url = generateDestinationURL(for: request) else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = request.endpoint.headers
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.httpBody = request.body
        urlRequest.timeoutInterval = request.timeout

        return urlRequest
    }

    private func generateDestinationURL(for request: Request) -> URL? {
        guard
            let url = URL(string: baseURL),
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            return nil
        }

        let queryItems = request.parameters?.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }

        components.path += request.endpoint.compositePath
        components.queryItems = queryItems

        return components.url
    }
}
