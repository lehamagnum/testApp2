//
//  NetworkClient.swift
//  testApp2
//
//  Created by Алексей Патрушев on 13.04.2025.
//

import Foundation

class NetworkClient {
    
    func send<R: RequestProtocol>(_ request: R, completion: @escaping (Result<R.Response, NetworkError>)-> Void) {
        
        URLSession.shared.dataTask(with: request.urlRequest) {data, responce, error in
            guard let data else {
                if let error {
                    completion(.failure(NetworkError.invalidRequest))
                    debugPrint("Ошибка запроса: \(error.localizedDescription)")
                }
                return
            }
            
            if let httpResponse = responce as? HTTPURLResponse {
                print("Код ответа: \(httpResponse.statusCode)")
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let JSONdata = try decoder.decode(R.Response.self, from: data)
                completion(.success(JSONdata))
            } catch {
                completion(.failure(NetworkError.decodingError))
            }
            
        }.resume()
        
    }
    
}
