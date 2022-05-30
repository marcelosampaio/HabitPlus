//
//  AppError.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 30/05/22.
//

import Foundation

enum AppError: Error {
    case response(message: String)
    
    
    public var message: String {
        switch self {
        case .response(let message):
            return message
        }
    }
}
