//
//  SplashViewRouter.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 11/05/22.
//

import SwiftUI

enum SplashViewRouter {
    
    static func makeSignInView() -> some View {
        let viewModel = SignInViewModel()
        return SignInView(viewModel: viewModel)
    }
    
}
