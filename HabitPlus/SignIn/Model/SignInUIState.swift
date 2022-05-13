//
//  SignInUIState.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 11/05/22.
//

import Foundation

enum SignInUIState: Equatable {
    case none
    case loading
    case goToHomeScreen
    case error(String)
}
