//
//  SignInView.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 11/05/22.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel : SignInViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .background(Color.blue)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(viewModel: SignInViewModel())
    }
}
