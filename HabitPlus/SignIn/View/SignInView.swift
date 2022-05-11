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
                Text("Main Screen")
            }else{
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
                                .font(Font.system(.title).bold())

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
        TextField("Informe seu email", text: $email)
//            .border(.gray)
            .padding(.top, 16)
            .keyboardType(.emailAddress)

    }
    
    var passwordField: some View {
        SecureField("Informe a senha", text: $password)
//            .border(.gray)
            .padding(.top, 24)
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
                NavigationLink(destination: Text("Tela de Cadastro"), tag: 1, selection: $action) {
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
        SignInView(viewModel: SignInViewModel())
    }
}
