//
//  SignInView.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 11/05/22.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel : SignInViewModel
    
    @State var action: Int? = 0
    
    var body: some View {
        
        ZStack {
            if case SignInUIState.goToHomeScreen = viewModel.uiState {
                viewModel.homeView()
            } else {
                NavigationView {
                    ScrollView(.vertical, showsIndicators: true) {
                        // 📍 Spacer
                        Spacer(minLength: 80)
                        
                        // 📍 VStack
                        VStack(alignment: .center, spacing: 8) {
                            
                            // 📍 logo
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .padding(.horizontal, 36)
                            
                            // 📍 functionality name
                            Text("Acesso ao sistema")
                                .foregroundColor(.orange)
                                .padding(.bottom, 8)
                                .font(Font.system(.subheadline).bold())
                                

                            // 📍 email text field
                            emailField
                               
                            // 📍 password text field
                            passwordField
                    
                            // 📍 proceed button
                            enterButton
                            // 📍 register button
                                
                            registerLink
                            
        //                    // 📍 copyright notes
        //                    Text("© 2022 - Quartarev Software")
        //                        .foregroundColor(.gray)
        //                        .font(Font.system(size: 12))
                            
                        } // - end of VStack
//                        .padding(.top, 184)
                        .padding(.horizontal, 36)
                        
                        if case SignInUIState.error(let value) = viewModel.uiState {
                            // generate an alert to the user
                            Text("")
                                .alert(isPresented: .constant(true)) {
                                    Alert(title: Text("HabitPlus"), message: Text("\(value)"), dismissButton: .default(Text("OK")) {
                                        // on completion - in this cas doing nothing
                                    })
                                }
                        }
                        
                    } // - end of scroll view
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.white)
                    .navigationTitle("Acesso ao sistema")
                    .navigationBarTitleDisplayMode(.automatic)
                    .navigationBarHidden(true)
            
                } // - end of NavigationView
            }
        }
        
        
    
    } // - end of body
}

extension SignInView {
    var emailField: some View {
        EditTextView(text: $viewModel.email,
                     placeholder: "Informe email",
                     keyboard: .emailAddress,
                     error: "Email inválido",
                     failure: !viewModel.email.isEmail(),
                     isSecure: false)
    }
}

extension SignInView {
    var passwordField: some View {
        EditTextView(text: $viewModel.password,
                     placeholder: "Informe senha",
                     keyboard: .default,
                     error: "Senha deve ter, no mínimo, 6 caracteres",
                     failure: viewModel.password.count < 6,
                     isSecure: true)
    }
}

extension SignInView {
    var enterButton: some View {
        LoadingButtonView(
            action: {
                viewModel.login(email: "", password: "")},
            text: "Entrar",
            showProgress: self.viewModel.uiState == SignInUIState.loading,
            disabled: (!viewModel.email.isEmail() || viewModel.password.count < 6))
    }
}

extension SignInView {
    var registerLink: some View {
        VStack {
            Text("Ainda não é cadastrado?")
                .foregroundColor(.gray)
                .padding(.top, 48)
            ZStack {
                NavigationLink(destination: viewModel.signUpView(), tag: 1, selection: $action) {
                    EmptyView()
                    
                    Button("Clique aqui") {
                        self.action = 1
                    }
                    .foregroundColor(.blue)
                     
                }
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { value in
            let viewModel = SignInViewModel()
            SignInView(viewModel: viewModel)
                .preferredColorScheme(value)
        }
    }
}
