//
//  ViewController.swift
//  Generics
//
//  Created by Raphael Berendes on 23.03.19.
//  Copyright © 2019 Raphael Berendes. All rights reserved.
//

import UIKit

struct Todo: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
        NetworkManager.execute(url: url) { (result: Result<Todo, SuperError>) in
            
            switch result {
            case .success(let todo):
                print(todo)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

