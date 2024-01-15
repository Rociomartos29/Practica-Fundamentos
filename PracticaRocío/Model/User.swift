//
//  User.swift
//  PracticaRocío
//
//  Created by Rocio Martos on 15/1/24.
//

import Foundation
struct User:Decodable {
    let username: String
    let password: String
        // Add other properties as needed

        // Initializer
        init(username: String, password: String) {
            self.username = username
            self.password = password
            // Initialize other properties if needed
        }
    }


