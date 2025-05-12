//
//  InterceptorProtocol.swift
//  testApp2
//
//  Created by Алексей Патрушев on 11.05.2025.
//

import Foundation

protocol RequestAdapterProtocol {
    
    func appVersionRequestAdapt(_ request: URLRequest) -> URLRequest
    
//    func logRequest(_ request: URLRequest)
    
    func logResponse(_ response: URLResponse?, data: Data?, error: Error?)
}
