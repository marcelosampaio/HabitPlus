//
//  ErrorResponse.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 18/05/22.
//

import Foundation


class ErrorResponse: Decodable {
    let detail: String
    
    enum CodingKeys: String, CodingKey {
        case detail
    }
    
    
}
