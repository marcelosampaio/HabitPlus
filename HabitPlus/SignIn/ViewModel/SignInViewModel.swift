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
                DispatchQueue.main.async {
                    self.uiState = .goToHomeScreen
                }
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
        
        WebService.login(request: SignInRequest(email: email, password: password)) { (successResponse, errorResponse) in
            if let error = errorResponse {
                DispatchQueue.main.async {
                    print("❌ login error: \(error.detail)")
                    self.uiState = .error(error.detail)
                }
            }
            
            if let success = successResponse {
                print(".... inside ...")
                DispatchQueue.main.async {
                    print("👍 login success: \(success)")
                    self.uiState = .goToHomeScreen
                }
            }

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



