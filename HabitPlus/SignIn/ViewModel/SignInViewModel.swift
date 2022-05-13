//
//  SignInViewModel.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 11/05/22.
//

import SwiftUI
import Combine


class SignInViewModel : ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    private var cancelleable: AnyCancellable?
    private let publisher = PassthroughSubject<Bool, Never>()
    @Published var uiState: SignInUIState = .none

    init() {
        cancelleable = publisher.sink(receiveValue: { value in
            print("👔 Combine - listener. Value: \(value). Redy to go to home view")
            if value {
                self.uiState = .goToHomeScreen
            }
        })
    }
    
    deinit {
        // stop listening 
        cancelleable?.cancel()
    }
    
    func login() {
        
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
        return SignInViewRouter.makeSignUpView(publisher: publisher)
    }
}



