//
//  NetworkClientWithAsync.swift
//  testApp2
//
//  Created by Алексей Патрушев on 25.04.2025.
//

import Foundation

class NetworkClient {
    
    func send<R: RequestProtocol>(_ request: R) async throws -> R.Response {
        
        let responce = try await URLSession.shared.data(for: request.urlRequest)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let result = try decoder.decode(R.Response.self, from: responce.0)
        
        return result
    }
}

