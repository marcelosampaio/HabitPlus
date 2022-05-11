//
//  SignInViewModel.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 11/05/22.
//

import SwiftUI

class SignInViewModel : ObservableObject {
    
    @Published var uiState: SignInUIState = .none
    
    func login(email: String, password: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // enters here after 2 seconds
            // server simulation
            self.uiState = .goToHomeScreen
        }
    }
    
}
