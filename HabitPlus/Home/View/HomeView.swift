//
//  HomeView.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 11/05/22.
//

import SwiftUI
import Combine

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        Text("Hello, home page!")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { value in
            let viewModel = HomeViewModel()
            HomeView(viewModel: viewModel)
                .preferredColorScheme(value)
        }
    }
}
