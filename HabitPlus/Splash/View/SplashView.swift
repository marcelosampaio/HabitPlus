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
                Text("go to login screen")
            case.goToHomeScreen:
                Text("go to home screen")
            case .error:
                loadingView(error: "❌ An error has been raised.")
            }
        }.onAppear {
            print("📍 Group .onAppear was triggered")
            viewModel.onAppear()
        }
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SplashViewModel()
        SplashView(viewModel: viewModel)
    }
}
 
