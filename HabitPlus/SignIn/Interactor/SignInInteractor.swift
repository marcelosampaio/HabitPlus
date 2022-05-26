//
//  SignInInteractor.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 26/05/22.
//

import Foundation


class SignInInteractor {
    // fazendo com que o viewModel que peça pro interactor tomar uma decisão (nese caso uma chamada http)
    // view model não sabe se a chamada sera remote ou local e etc....
    private let remote: RemoteDataSource = .shared
//    private let local: LocalDataSource
}     

extension SignInInteractor {
    func login(loginRequest request: SignInRequest, completion: (SignInResponse?, SignInErrorResponse?) -> Void) {
        remote.login(request: request, completion: completion)
        
    }
}