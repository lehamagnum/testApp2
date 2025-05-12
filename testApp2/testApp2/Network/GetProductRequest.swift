//
//  GetProductRequest.swift
//  testApp2
//
//  Created by Алексей Патрушев on 23.04.2025.
//

import Foundation

struct GetProductRequest: RequestProtocol {
    
    typealias Response = [ProductModel]
    
    var scheme = "https"
    var host = "fakestoreapi.com"
    var path = "/products"
    var queryItems: [URLQueryItem]? = nil
    var headers: [String : String]? = nil
    
    var method = "GET"
    
    func createURL() -> URL {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        guard let url = components.url else { fatalError("Incorrect URL") }
        return url
    }

    var urlRequest: URLRequest {
        var request = URLRequest(url: createURL())
        request.httpMethod = method
        return request
    }
}
