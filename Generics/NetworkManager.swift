//
//  NetworkManager.swift
//  Generics
//
//  Created by Raphael Berendes on 26.04.19.
//  Copyright © 2019 Raphael Berendes. All rights reserved.
//

import Foundation

struct NetworkManager {
    
    static internal func execute<T: Decodable>(url: URL, data: Data? = nil, param: Int64? = nil, completion: @escaping (Result<T, SuperError>) -> Void) {
        
        CommunicationManager.shared.perform(for: url) { (data, response, error) in
            
            if let httpRepsonse = response as? HTTPURLResponse {
                guard let data = data else {
                    completion(.failure(.superFail))
                    return
                }
                
                switch httpRepsonse.statusCode {
                case 200:
                    do {
                        let result = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(result))
                    } catch {
                        completion(.failure(.superFail))
                    }
                default:
                    completion(.failure(.superFail))
                }
            } else {
                completion(.failure(.superFail))
            }
        }
    }

    
}
