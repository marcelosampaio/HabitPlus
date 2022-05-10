//
//  UIView+Splash.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 10/05/22.
//

import SwiftUI

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
