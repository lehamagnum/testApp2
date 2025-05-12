//
//  AppVersionRequestAdapter.swift
//  testApp2
//
//  Created by Алексей Патрушев on 11.05.2025.
//

import Foundation

class RequestAdapters: RequestAdapterProtocol {
    
    func appVersionRequestAdapt(_ request: URLRequest) -> URLRequest {
        var adaptedRequest = request
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "unknown"
        adaptedRequest.setValue(appVersion, forHTTPHeaderField: "X-App-Version")
        return adaptedRequest
    }
    
//    func logRequest(_ request: URLRequest) {
//        print("➡️ [REQUEST]")
//        print("URL: \(request.url?.absoluteString ?? "nil")")
//        print("Method: \(request.httpMethod ?? "nil")")
//        if let headers = request.allHTTPHeaderFields {
//            print("Headers: \(headers)")
//        }
//        if let body = request.httpBody,
//           let bodyString = String(data: body, encoding: .utf8) {
//            print("Body: \(bodyString)")
//        }
//    }
    
    func logResponse(_ response: URLResponse?, data: Data?, error: Error?) {
        print("⬅️ [RESPONSE]")
        if let httpResponse = response as? HTTPURLResponse {
            print("Status code: \(httpResponse.statusCode)")
            print("URL: \(httpResponse.url?.absoluteString ?? "nil")")
            print("Headers: \(httpResponse.allHeaderFields)")
        }
        if let data = data {
            print("Body: \(data)")
        }
        if let error = error {
            print("Error: \(error)")
        }
    }
    
}
