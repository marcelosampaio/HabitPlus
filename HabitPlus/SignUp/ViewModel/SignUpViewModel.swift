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
    
    private var cancellableSignUp: AnyCancellable?
    private var cancellableSignin: AnyCancellable?
    
    @Published var uiState: SignUpUIState = .none
    
    private let interactor: SignUpInteractor
    
    init(interactor: SignUpInteractor) {
        self.interactor = interactor
    }
    
    deinit {
        cancellableSignUp?.cancel()
        cancellableSignin?.cancel()
    }
    
    
    func signUp() {
        self.uiState = .loading
        
        let signUpRequest = SignUpRequest(fullName: fullName,
                                          email: email,
                                          password: password,
                                          document: document,
                                          phone: phone,
                                          birthday: birthday.toDateString(),
                                          gender: gender.index)
        
        cancellableSignUp = interactor.postUser(signUpRequest: signUpRequest)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                // ERROR or FINISHED
                switch completion {
                case .failure(let appError):
                    print("❌ signUpInteractor POST USER ERROR")
                    self.uiState = .error(appError.message)
                    break
                case .finished:
                    print("👍 signUpInteractor FINISHED")
                    break
                }
            } receiveValue: { created in
                if created {
                    // print("👍 signUp success. user has been created")
                    self.cancellableSignin = self.interactor.login(signinRequest: SignInRequest(email: self.email,
                                                                                                password: self.password))
                    .receive(on: DispatchQueue.main)
                    .sink { completion in
                        // ERROR or FINISHED
                        switch completion {
                        case .failure(let appError):
                            print("❌ signUpInteractor LOGIN ERROR")
                            self.uiState = .error(appError.message)
                            break
                        case .finished:
                            print("👍 signUp interactor login FINISHED")
                            break
                        }
                        
                    } receiveValue: { successSignIn in
                        print("👍 signUp interactor login SUCCESS")
                        self.publisher.send(created)
                        self.uiState = .success
                    }
                }
            }
    }
}

extension SignUpViewModel {
    func homeView() -> some View {
        return SignUpViewRouter.makeHomeView()
    }
    

    
    
}
