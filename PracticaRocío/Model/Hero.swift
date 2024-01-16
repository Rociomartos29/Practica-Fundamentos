//
//  Hero.swift
//  PracticaRocío
//
//  Created by Rocio Martos on 15/1/24.
//

import Foundation

struct Heroe: Codable {

  let id: Int
  let nombre: String
  let descripcion: String
  let imageURL: URL

  enum CodingKeys: String, CodingKey {
    case id
    case nombre
    case descripcion
    case imageURL
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    id = try container.decode(Int.self, forKey: .id)
    nombre = try container.decode(String.self, forKey: .nombre)
    descripcion = try container.decode(String.self, forKey: .descripcion)
    imageURL = try container.decode(URL.self, forKey: .imageURL)
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encode(nombre, forKey: .nombre)
    try container.encode(descripcion, forKey: .descripcion)
    try container.encode(imageURL, forKey: .imageURL)
  }

}

struct Transformacion: Codable {

  let id: Int
  let nombre: String
  let descripcion: String
  let imagenURL: URL

  enum CodingKeys: String, CodingKey {
    case id
    case nombre
    case descripcion
    case imagenURL
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    id = try container.decode(Int.self, forKey: .id)
    nombre = try container.decode(String.self, forKey: .nombre)
    descripcion = try container.decode(String.self, forKey: .descripcion)
    imagenURL = try container.decode(URL.self, forKey: .imagenURL)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encode(nombre, forKey: .nombre)
    try container.encode(descripcion, forKey: .descripcion)
    try container.encode(imagenURL, forKey: .imagenURL)
  }

}

struct Planet: Codable {
  let name: String
  let description: String

  enum CodingKeys: String, CodingKey {
    case name
    case description
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    name = try container.decode(String.self, forKey: .name)
    description = try container.decode(String.self, forKey: .description)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(name, forKey: .name)
    try container.encode(description, forKey: .description)
  }

}
