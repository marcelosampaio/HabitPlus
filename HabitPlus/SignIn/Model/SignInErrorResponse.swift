//
//  SignInErrorResponse.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 23/05/22.
//

import Foundation


struct SignInErrorResponse: Decodable {
    let detail: SignInDetailErrorResponse
    
    enum CodingKeys: String, CodingKey {
        case detail
    }
    
}


struct SignInDetailErrorResponse: Decodable {
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case message
    }
    
}
