//
//  HeroesService.swift
//  PracticaRocío
//
//  Created by Rocio Martos on 15/1/24.
//

import Foundation

class HeroService {

  static let shared = HeroService()

  private init() {}

  func login(username: String, password: String, completion: @escaping (Result<Token, Error>) -> Void) {

    guard !username.isEmpty, !password.isEmpty else {
      completion(.failure(URLError(.badURL)))
      return
    }

    let url = URL(string: "https://dbz-api.com/login")!

    var request = URLRequest(url: url)
    request.httpMethod = "POST"

    let body = ["username": username, "password": password]
    request.httpBody = try? JSONSerialization.data(withJSONObject: body)

    URLSession.shared.dataTask(with: request) { data, response, error in

      if let error = error {
        completion(.failure(error))
        return
      }

      guard let data = data, let token = try? JSONDecoder().decode(Token.self, from: data) else {
        completion(.failure(URLError(.badServerResponse)))
        return
      }

      completion(.success(token))

    }.resume()
  }

  func fetchHeroes(completion: @escaping (Result<[Heroe], Error>) -> Void) {
    
    // Call API
    let url = URL(string: "https://dragonball.keepcoding.education/api/heros/all")!

    URLSession.shared.dataTask(with: url) { data, response, error in

      if let error = error {
        completion(.failure(error))
        return
      }

      guard let data = data, let heroes = try? JSONDecoder().decode([Heroe].self, from: data) else {
        completion(.failure(URLError(.badServerResponse)))
        return
      }

      completion(.success(heroes))

    }.resume()
  }

  // Other service methods...

}

struct Token: Decodable {
  let token: String
}
