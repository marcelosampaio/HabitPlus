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
 
extension SplashView {
    func loadingView(error: String? = nil) -> some View {
        ZStack {
            Image("logo")
                .resizable()
                .padding(.horizontal, 24.0)
                .padding(.vertical, 16.0)
                .scaledToFit()
                .ignoresSafeArea()
            
            if let error = error {
                Text("")
                    .alert(isPresented: .constant(true)) {
                        Alert(title: Text("HabitPlus"), message: Text("\(error)"), dismissButton: .default(Text("OK")) {
                            // on completion - in this cas doing nothing
                        })
                    }
            }
            
            
        }
    }
}
