//
//  CommunicationManager.swift
//  Generics
//
//  Created by Raphael Berendes on 28.04.19.
//  Copyright © 2019 Raphael Berendes. All rights reserved.
//

import Foundation

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
