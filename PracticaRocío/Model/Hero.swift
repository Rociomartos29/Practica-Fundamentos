//
//  Hero.swift
//  PracticaRocío
//
//  Created by Rocio Martos on 15/1/24.
//

import Foundation
public struct Hero: Codable {
    
    public let id: Int
    public let name: String
    public let description: String
    public let imageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case imageURL
    }
}
