//
//  SignInInteractor.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 26/05/22.
//

import Foundation
import Combine

class SignInInteractor {
    // fazendo com que o viewModel que peça pro interactor tomar uma decisão (nese caso uma chamada http)
    // view model não sabe se a chamada sera remote ou local e etc....
    private let remote: SignInRemoteDataSource = .shared
//    private let local: LocalDataSource
}     

extension SignInInteractor {
    func login(loginRequest request: SignInRequest) -> Future<SignInResponse, AppError> {
        return remote.login(request: request)
        
    }
}
