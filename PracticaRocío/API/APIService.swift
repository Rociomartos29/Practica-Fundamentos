//
//  APIService.swift
//  PracticaRocío
//
//  Created by Rocio Martos on 16/1/24.
//

import Foundation
class APIService {
    
    static let shared = APIService()
    
    func login(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        
        let url = URL(string: "https://example.com/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let bodyData = "username=\(username)&password=\(password)"
        request.httpBody = bodyData.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "Error", code: 0, userInfo: nil)
                completion(.failure(error))
                return
            }
            
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                completion(.success(user))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
        
    }
    func getHeroes(completion: @escaping (Result<[Heroe], Error>) -> Void) {
        
        let url = URL(string: "https://example.com/heroes")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "Error", code: 0, userInfo: nil)
                completion(.failure(error))
                return
            }
            
            do {
                let heroes = try JSONDecoder().decode([Heroe].self, from: data)
                completion(.success(heroes))
            } catch {
                completion(.failure(error))
            }
            
        }
        .resume()
        
    }
    
    func getHero(id: Int, completion: @escaping (Result<Heroe, Error>) -> Void) {
        
        let url = URL(string: "https://dragonball.keepcoding.education/heroes/\(id)")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "Error", code: 0, userInfo: nil)
                completion(.failure(error))
                return
            }
            
            do {
                let hero = try JSONDecoder().decode(Heroe.self, from: data)
                completion(.success(hero))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
        
    }
    static func login(loginVC: LoginViewController, username: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {

      // llamada API

      let result = completion()

      switch result {

        case .success(let user):
          loginVC.loginDidSucceed(user: user)

        case .failure(let error):
          loginVC.loginDidFail(error: error)

      }

    }
        
}
