//
//  SplashView.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 10/05/22.
//

import SwiftUI

struct SplashView: View {
    
    @State var state: SplashUIState = .loading
    
    var body: some View {
        
        switch state {
        case .loading:
            loadingView()
        case .goToSignInScreen:
            Text("go to login screen")
        case.goToHomeScreen:
            Text("go to home screen")
        case .error:
            Text("error")
        }
    }
}


extension SplashView {
    func loadingView() -> some View {
        ZStack {
            Image("logo")
                .resizable()
                .padding(.horizontal, 24.0)
                .padding(.vertical, 16.0)
                .scaledToFit()
                .ignoresSafeArea()
        }
    }
    
}


struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
 
