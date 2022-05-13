//
//  SignUpUIState.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 12/05/22.
//

import Foundation

enum SignUpUIState: Equatable {
    case none
    case loading
    case success
    case error(String)
}
