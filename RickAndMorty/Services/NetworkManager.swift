//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Shevshelev Lev on 11.03.2022.
//

import Foundation

enum NetworkError: Error {
    case noData
    case invalidURL
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init () {}
    
    func fetchCharacters<T: Decodable>(from urlString: String, type: T.Type, completion: @escaping (_ answer: T) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? " No Description")
                return
            }
            
            do {
                let answer = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(answer)
                }
            } catch let error {
                print("Error serialization", error)
            }
        }.resume()
    }
    
    func fetchEpisode<T: Decodable>(from urlString: String, type: T.Type) throws -> T {
        guard let url = URL(string: urlString) else { throw NetworkError.invalidURL }
        guard let episodeData = try? Data(contentsOf: url) else { throw NetworkError.noData}
        guard let episode = try? JSONDecoder().decode(T.self, from: episodeData) else { throw NetworkError.decodingError}
        return episode
    }
    
    func fetchImageData(from urlString: String) -> Data? {
        guard let url = URL(string: urlString) else { return nil }
        guard let imageData = try? Data(contentsOf: url) else { return nil }
        return imageData
    }
}


