//
//  NetworkRequest.swift
//  testApp2
//
//  Created by Алексей Патрушев on 13.04.2025.
//

import Foundation
class NetworkRequest {
    
    static let shared = NetworkRequest()
    
    private init() {}
    
    func getData(completion: @escaping (Result<[TestModel], Error>) -> Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            guard let data else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let data = try decoder.decode([TestModel].self, from: data)
                completion(.success(data))
            } catch {
                completion(.failure(NetworkError.invalidData))
            }
        }
        .resume()
    }
}
