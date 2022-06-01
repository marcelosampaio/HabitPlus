//
//  SignUpRemoteDataSource.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 01/06/22.
//

import Foundation
import Combine


class SignUpRemoteDataSource {
    // Simgleton Pattern
    static var shared: SignUpRemoteDataSource = SignUpRemoteDataSource()
     
    private init() {
        
    }
    
    func postUser(request: SignUpRequest) -> Future<Bool, AppError> {
        return Future { promise in
            WebService.call(path: .postUser, body: request) { result in
                // completion
                switch result {
                    case .failure(let networkError, let data):
                        if let data = data {
                            if networkError == .badRequest {
                                let decoder = JSONDecoder()
                                let response = try? decoder.decode(ErrorResponse.self, from: data)
                                print("❌ WebService postUser error")
                                promise(.failure(AppError.response(message: response?.detail ?? "Webservice internal error.")))
                            }
                        }
                        break
                case .success(_):
                        print("👍 WebService postUser - success")
                        promise(.success(true))
                        break
                }
            }
        }
        
        

    }

    
}

