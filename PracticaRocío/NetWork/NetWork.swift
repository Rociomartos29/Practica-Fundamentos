//
//  NetWork.swift
//  PracticaRocío
//
//  Created by Rocio Martos on 15/1/24.
//

import Foundation
class NetworkService {
    static let shared = NetworkService()

    init() {}

    func login(username: String, password: String, completion: @escaping (User?, Error?) -> Void) {
        guard let url = URL(string: "https://dragonball.keepcoding.education/api/auth/login") else {
                    completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
                    return
                }

                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                
                // Aquí configura tu solicitud según los requisitos de tu servidor
                // Por ejemplo, puedes configurar el cuerpo de la solicitud con el nombre de usuario y la contraseña
                let parameters: [String: Any] = ["username": username, "password": password]
                request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])

                URLSession.shared.dataTask(with: request) { data, response, error in
                    guard let data = data, error == nil else {
                        completion(nil, error)
                        return
                    }

                    do {
                        let user = try JSONDecoder().decode(User.self, from: data)
                        completion(user, nil)
                    } catch {
                        completion(nil, error)
                    }
                }.resume()
            }
        }
    

func fetchHeroes(completion: @escaping ([Hero]?, Error?) -> Void) {
        guard let url = URL(string: "https://dragonball.keepcoding.education/api/heros/all") else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }

            do {
                let heroes = try JSONDecoder().decode([Hero].self, from: data)
                completion(heroes, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
}



func fetchTransformations(for heroID: Int, completion: @escaping ([Transformation]?, Error?) -> Void) {
        let endpoint = "https://dragonball.keepcoding.education/api/heros/\(heroID)/transformations"

        guard let url = URL(string: endpoint) else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }

            do {
                let transformations = try JSONDecoder().decode([Transformation].self, from: data)
                completion(transformations, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
}



