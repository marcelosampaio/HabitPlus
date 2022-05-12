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
        
        // change status to mock state
        self.uiState = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            // enters here after 2 seconds
            // server simulation
            self.uiState = .goToHomeScreen
//            self.uiState = .error("An error occurred. Try later!")
        }
    }
    
}


extension SignInViewModel {
    func homeView() -> some View {
        return SignInViewRouter.makeHomeView()
    }
    func signUpView() -> some View {
        return SignInViewRouter.makeSignUpView()
    }
}



