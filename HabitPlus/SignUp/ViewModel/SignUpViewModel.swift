//
//  SignUpViewModel.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 12/05/22.
//

import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
    
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var document = ""
    @Published var phone = ""
    @Published var birthday = ""
    @Published var gender = Gender.male
    
    var publisher: PassthroughSubject<Bool, Never>!
    
    @Published var uiState: SignUpUIState = .none
    
    func signUp() {
        self.uiState = .loading

        WebService.postUser(request: SignUpRequest(fullName: fullName,
                                                   email: email,
                                                   password: password,
                                                   document: document,
                                                   phone: phone,
                                                   birthday: birthday.toDateString(),
                                                   gender: gender.index)) { (successResponse, errorResponse) in
            if let error = errorResponse {
                DispatchQueue.main.async {
                    self.uiState = .error(error.detail)
                }
            }
            
            if let success = successResponse {
                // 🌍 auto login
//                WebService.login(request: SignInRequest(email: self.email,
//                                                        password: self.password)) { (successResponse, errorResponse) in
//                    if let errorSignIn = errorResponse {
//                        DispatchQueue.main.async {
//                            print("❌ login error: \(errorSignIn.detail.message)")
//                            self.uiState = .error(errorSignIn.detail.message)
//                        }
//                    }
//                    if let successSignIn = successResponse {
//                        DispatchQueue.main.async {
//                            print("👍 login success: \(successSignIn)")
//                            self.publisher.send(success)
//                            self.uiState = .success
//                        }
//                    }
//                }
//                
//                DispatchQueue.main.async {
//                    self.publisher.send(success)
//                    if success {
//                        self.uiState = .success
//                    }
//                }
            }
        }
    }
        
}

extension SignUpViewModel {
    func homeView() -> some View {
        return SignUpViewRouter.makeHomeView()
    }
    

    
    
}
