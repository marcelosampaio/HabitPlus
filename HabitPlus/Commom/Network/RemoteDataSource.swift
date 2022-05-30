//
//  RemoteDataSource.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 26/05/22.
//

import Foundation
import Combine


class RemoteDataSource {
    // Simgleton Pattern
    
    static var shared: RemoteDataSource = RemoteDataSource()
     
    private init() {
        
    }
    
    func login(request: SignInRequest) -> Future<SignInResponse, AppError> {
        return Future<SignInResponse, AppError> { promise in
            WebService.call(path: .login, params: [
                URLQueryItem(name: "username", value: request.email),
                URLQueryItem(name: "password", value: request.password)
                ]) { result in
                // completion
                switch result {
                    case .failure(let error, let data):
                        if let data = data {
                            if error == .unauthorized {
                                let decoder = JSONDecoder()
                                let response = try? decoder.decode(SignInErrorResponse.self, from: data)
                                // replaced callback with promise
                                promise(.failure(AppError.response(message: response?.detail.message ?? "Erro desconhecido" )))
                            }
                        }
                        break
                        
                    case .success(let data):
                        let decoder = JSONDecoder()
                        let response = try? decoder.decode(SignInResponse.self, from: data)
                    guard let response = response else {
                        print("❌ Parse error: \(String(data: data, encoding: .utf8))")
                        return
                        }
                    // replaced callback with promise
                    promise(.success(response))
                        break
                }
            }
        }
        
    }
    
}
