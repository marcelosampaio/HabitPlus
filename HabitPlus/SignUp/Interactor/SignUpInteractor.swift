//
//  SignUpInteractor.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 01/06/22.
//

import Foundation
import Combine


class SignUpInteractor {
    // fazendo com que o viewModel que peça pro interactor tomar uma decisão (nese caso uma chamada http)
    // view model não sabe se a chamada sera remote ou local e etc....
    private let remoteSignUp: SignUpRemoteDataSource = .shared
    private let remoteSignIn: SignInRemoteDataSource = .shared
//    private let local: LocalDataSource
}

extension SignUpInteractor {
    func postUser(signUpRequest request: SignUpRequest) -> Future<Bool, AppError> {
        return remoteSignUp.postUser(request: request)
        
    }
    
    func login(signinRequest request: SignInRequest) -> Future<SignInResponse, AppError> {
        return remoteSignIn.login(request: request)
    }
}


