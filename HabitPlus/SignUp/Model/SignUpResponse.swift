//
//  SignUpResponse.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 18/05/22.
//

import Foundation

struct SignUpResponse: Decodable {
    let detail: String?
    
    enum CodingKeys: String, CodingKey {
        case detail
    }
    
}
