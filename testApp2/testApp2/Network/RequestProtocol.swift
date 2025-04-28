//
//  RequestProtocol.swift
//  testApp2
//
//  Created by Алексей Патрушев on 23.04.2025.
//

import Foundation

protocol RequestProtocol {
    
    associatedtype Response: Decodable
    
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    var headers: [String: String]? { get }
    
    var method: String { get }
    
    func createURL() -> URL
    
    var urlRequest: URLRequest { get }

}
