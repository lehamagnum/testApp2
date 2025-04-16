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

    private func createURL() -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "fakestoreapi.com"
        components.path = "/products"
        components.queryItems = []
        let url = components.url
        return url
    }
    
    func getData(completion: @escaping (Result<[ProductModel], NetworkError>) -> Void) {
        
        guard let url = createURL() else { return debugPrint("Invalid URL") }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                if let error {
                    completion(.failure(NetworkError.invalidData))
                    debugPrint("Ошибка запроса: \(error.localizedDescription)")
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Код ответа: \(httpResponse.statusCode)")
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let JSONdata = try decoder.decode([ProductModel].self, from: data)
                completion(.success(JSONdata))
            } catch {
                completion(.failure(NetworkError.invalidData))
            }
        }
        .resume()
    }
}
