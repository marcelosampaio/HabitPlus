//
//  SignInViewRouter.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 11/05/22.
//

import SwiftUI

enum SignInViewRouter {
    
    static func makeHomeView() -> some View {
        let viewModel = HomeViewModel()
        return HomeView(viewModel: viewModel)
    }
    
    static func makeSignUpView() -> some View {
        return SignUpView(viewModel: SignUpViewModel())
    }
    
}
