//
//  SplashView.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 10/05/22.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel
    
    var body: some View {
        Group {
            switch viewModel.uiState {
            case .loading:
                loadingView()
            case .goToSignInScreen:
                viewModel.signInView()
            case.goToHomeScreen:
                Text("go to home screen")
            case .error:
                loadingView(error: "❌ An error has been raised.")
            }
        }.onAppear(perform: viewModel.onAppear)
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(viewModel: SplashViewModel())
    }
}
 
