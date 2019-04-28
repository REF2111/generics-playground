//
//  Models.swift
//  Generics
//
//  Created by Raphael Berendes on 28.04.19.
//  Copyright © 2019 Raphael Berendes. All rights reserved.
//

struct Todo: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
