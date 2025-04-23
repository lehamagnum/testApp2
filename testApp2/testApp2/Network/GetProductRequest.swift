//
//  GetProductRequest.swift
//  testApp2
//
//  Created by Алексей Патрушев on 23.04.2025.
//

import Foundation

struct GetProductRequest: RequestProtocol {
    
    typealias Response = [ProductModel]
    
    var baseUrlString = "https://fakestoreapi.com"
    var path = "/products"
    var queryItems: [URLQueryItem]? = nil
    var method = "GET"
    var headers: [String : String]? = nil
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: URL(string: "\(baseUrlString)\(path)")!)
        request.httpMethod = method
        return request
    }
    
}
