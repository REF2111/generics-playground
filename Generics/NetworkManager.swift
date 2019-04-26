//
//  NetworkManager.swift
//  Generics
//
//  Created by Raphael Berendes on 26.04.19.
//  Copyright © 2019 Raphael Berendes. All rights reserved.
//

import Foundation

enum SuperError: Error {
    case shit
}

class CommunicationManager {
    
    static let shared = CommunicationManager()
    private init() {}
    
    private func perform(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: completionHandler)
        task.resume()
    }
    
    func perform(for url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        let request = URLRequest(url: url)
        perform(with: request, completionHandler: completionHandler)
    }
    
}

struct NetworkManager {
    
    static internal func execute<T: Decodable>(url: URL, data: Data? = nil, param: Int64? = nil, completion: @escaping (Result<T, SuperError>) -> Void) {
        
        CommunicationManager.shared.perform(for: url) { (data, response, error) in
            
            if let httpRepsonse = response as? HTTPURLResponse {
                guard let data = data else {
                    completion(.failure(.shit))
                    return
                }
                
                switch httpRepsonse.statusCode {
                case 200:
                    do {
                        let result = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(result))
                    } catch {
                        completion(.failure(.shit))
                    }
                default:
                    completion(.failure(.shit))
                }
            } else {
                completion(.failure(.shit))
            }
        }
    }

    
}
