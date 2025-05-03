//
//  NetworkClient.swift
//  testApp2
//
//  Created by Алексей Патрушев on 25.04.2025.
//

import Foundation
import RxSwift
import RxCocoa

class NetworkClient {
    // async/await
    func sendAsync<R: RequestProtocol>(_ request: R) async throws -> R.Response {
        
        let responce = try await URLSession.shared.data(for: request.urlRequest)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let result = try decoder.decode(R.Response.self, from: responce.0)
        
        return result
    }
    // completion
    func sendCompletion<R: RequestProtocol>(_ request: R, completion: @escaping (Result<R.Response, NetworkError>)-> Void) {
        
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
    // RX
    func sendRx<R: RequestProtocol>(_ request: R) -> Observable<R.Response> {
        
            return Observable.create { observer in
                
                let task = URLSession.shared.rx
                    .data(request: request.urlRequest)
                    .subscribe(onNext: { data in
                        
                        do {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let result = try decoder.decode(R.Response.self, from: data)
                            observer.onNext(result)
                            observer.onCompleted()
                        } catch {
                            observer.onError(NetworkError.decodingError)
                        }
                    }, onError: { error in
                        observer.onError(error)
                    })

                return Disposables.create {
                    task.disposed(by: DisposeBag())
                }
            }
        }
}

