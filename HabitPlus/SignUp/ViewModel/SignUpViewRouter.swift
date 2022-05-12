//
//  SignUpViewRouter.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 12/05/22.
//

import SwiftUI

enum SignUpViewRouter {
    
    static func makeHomeView() -> some View {
        let viewModel = HomeViewModel()
        return HomeView(viewModel: viewModel)
    }
    
    
}
