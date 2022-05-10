//
//  UIView+Splash.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 10/05/22.
//

import SwiftUI

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
