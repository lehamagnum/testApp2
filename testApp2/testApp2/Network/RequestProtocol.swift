//
//  RequestProtocol.swift
//  testApp2
//
//  Created by Алексей Патрушев on 23.04.2025.
//

import Foundation

protocol RequestProtocol {
    associatedtype Response: Decodable
    
    var baseUrlString: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    var method: String { get }
    var headers: [String: String]? { get }
    
    var urlRequest: URLRequest { get }
}
