//
//  SignInView.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 11/05/22.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel : SignInViewModel
    
    @State var email = ""
    @State var password = ""
    
    @State var action: Int? = 0
    
    var body: some View {
        
        ZStack {
            if case SignInUIState.goToHomeScreen = viewModel.uiState {
                viewModel.homeView()
            } else {
                NavigationView {
                    ScrollView(.vertical, showsIndicators: true) {
                        // 📍 VStack
                        VStack(alignment: .center, spacing: 8) {
                            
                            // 📍 logo
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .padding(.horizontal, 48)
                            
                            // 📍 functionality name
                            Text("Acesso ao sistema")
                                .foregroundColor(.orange)
                                .padding(.bottom, 8)
                                .font(Font.system(.subheadline).bold())
                                

                            // 📍 email text field
                            emailField
                                .padding(.horizontal, 38)
                            // 📍 password text field
                            passwordField
                                .padding(.horizontal, 38)
                            // 📍 proceed button
                            enterButton
                            // 📍 register button
                                .padding(.top, 24)
                            registerLink
                            
        //                    // 📍 copyright notes
        //                    Text("© 2022 - Quartarev Software")
        //                        .foregroundColor(.gray)
        //                        .font(Font.system(size: 12))
                            
                        } // - end of VStack
                        .padding(.top, 184)
                        
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
                    .navigationBarTitleDisplayMode(.large)
                    .navigationBarHidden(true)
                } // - end of NavigationView
            }
        }
        
        
    
    } // - end of body
}

extension SignInView {
    var emailField: some View {
        EditTextView(text: $email,
                     placeholder: "Informe email",
                     keyboard: .emailAddress,
                     error: "Email inválido",
                     failure: !email.isEmail(),
                     isSecure: false)
    }
    
    var passwordField: some View {
//        SecureField("Informe a senha", text: $password)
//            .padding(.top, 24)
        EditTextView(text: $password,
                     placeholder: "Informe senha",
                     keyboard: .default,
                     error: "Senha deve ter, no mínimo, 6 caracteres",
                     failure: password.count < 6,
                     isSecure: true)
    }
    
    var enterButton: some View {
        Button("Entrar") {
            print("enter button was tapped")
            viewModel.login(email: email, password: password)
        }
        .font(Font.system(.title).bold())
    }
    
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
