//
//  SignUpViewModel.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 12/05/22.
//

import SwiftUI

class SignUpViewModel: ObservableObject {
    
    @Published var uiState: SignUpUIState = .none
    
    
    
}

extension SignUpViewModel {
    func homeView() -> some View {
        return SignUpViewRouter.makeHomeView()
    }
}
