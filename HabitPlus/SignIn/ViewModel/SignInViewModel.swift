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
    
    private var cancellable: AnyCancellable?
    private var cancellableRequest: AnyCancellable?
    
    private let publisher = PassthroughSubject<Bool, Never>()
    @Published var uiState: SignInUIState = .none
    
    private let interactor: SignInInteractor
    

    init(interactor: SignInInteractor) {
        self.interactor = interactor
        cancellable = publisher.sink(receiveValue: { value in
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
        cancellable?.cancel()
        cancellableRequest?.cancel()
    }
    
    func login() {
        
        // change status to mock state
        self.uiState = .loading
        
        cancellableRequest = interactor.login(loginRequest: SignInRequest(email: email,
                                                     password: password))
        .receive(on: DispatchQueue.main)
        .sink { completion in
            // ERROR or FINISHED
            switch (completion) {
                case .failure(let appError):
                print("❌ login error: \(appError.message)")
                    self.uiState = SignInUIState.error(appError.message)
                    break
                case .finished:
                    break
            }
            
        } receiveValue: { success in
            // SUCCESS
            print("👍 login success: \(success)")
            self.uiState = .goToHomeScreen
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



