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
    
    private static func completeUrl(path: Endpoint) -> URLRequest? {
        guard let url = URL(string: "\(Endpoint.base.rawValue)\(path.rawValue)") else {
            return nil
        }
        return URLRequest(url: url)
    }
    
    
    static func postUser( fullName: String,
                          email: String,
                          password: String,
                          document: String,
                          phone: String,
                          birthday: String,
                          gender: Int) {
        
        let json: [String: Any] = [
            "name": fullName,
            "email": email,
            "password": password,
            "document": document,
            "phone": phone,
            "birthday": birthday,
            "gender": gender
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        
        guard var urlRequest = completeUrl(path: .postUser) else { return }
        
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "accept")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = jsonData
        
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            // completion
            guard let data = data, error == nil else {
                print("❌ errpr URLSession dataTask: \(String(describing: error?.localizedDescription))")
                return
            }
            print("📍 data: \(String(data: data, encoding: .utf8))")
            print("📍 response: \n")
            print(response)
            if let rsp = response as? HTTPURLResponse {
                
                print("📍 return code: \(rsp.statusCode)")
            }
        }
        
        task.resume()
        
        
        
    }
}
