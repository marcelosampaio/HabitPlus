//
//  SplashViewModel.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 11/05/22.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published var uiState: SplashUIState = .loading
    
    func onAppear() {
        // async job and chages uiState
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // enters here after 2 seconds
            // server simulation
            self.uiState = .goToSignInScreen
        }
    }
}
