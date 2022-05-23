//
//  WebService.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 17/05/22.
//

import Foundation

enum WebService {
    enum Endpoint: String {
        case base = "https://habitplus-api.tiagoaguiar.co"
        case postUser = "/users"
        
    }
    
    enum NetworkError {
        case badRequest
        case notFound
        case unauthorized
        case internalServerError
    }
    
    enum Result {
        case success (Data)
        case failure (NetworkError, Data?)
    }
    
    
    private static func completeUrl(path: Endpoint) -> URLRequest? {
        guard let url = URL(string: "\(Endpoint.base.rawValue)\(path.rawValue)") else {
            return nil
        }
        return URLRequest(url: url)
    }
    
    private static func call<T: Encodable>(path: Endpoint,
                                           body: T,
                                        completion: @escaping (Result) -> Void ) {
        
        guard var urlRequest = completeUrl(path: path) else { return }
        guard let jsonData = try? JSONEncoder().encode(body) else { return }
        
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "accept")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            // completion
            guard let data = data, error == nil else {
                completion(.failure(.internalServerError, nil))
                return
            }
            if let rsp = response as? HTTPURLResponse {
                switch rsp.statusCode {
                case 200:
                    completion(.success(data))
                case 400:
                    completion(.failure(.badRequest, data))
                    break
                default:
                    print("default case value")
                }
            }
        }
        task.resume()
    }
    
    
    static func postUser(request: SignUpRequest, completion: @escaping (Bool?, ErrorResponse?) -> Void) {
        call(path: .postUser, body: request) { result in
            // completion
            switch result {

            case .failure(let networkError, let data):
                if let data = data {
                    if networkError == .badRequest {
                        let decoder = JSONDecoder()
                        let response = try? decoder.decode(ErrorResponse.self, from: data)
                        
                        completion(nil, response)
                    }
                }
                break
                
            case .success(let data):
                completion(true, nil)
                break
            }
        }
    }
}
