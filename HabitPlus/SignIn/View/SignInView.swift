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
        
        NavigationView {
            // 📍 VStack
            VStack(alignment: .center, spacing: 8) {
                
                // 📍 logo
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 16)
                
                // 📍 functionality name
                Text("Acesso ao sistema")
                    .foregroundColor(.orange)
                    .padding(.bottom, 8)
                    .font(Font.system(.title).bold())

                // 📍 email text field
                emailField
                
                // 📍 password text field
                passwordField
                
                // 📍 proceed button
                enterButton
                
                // 📍 register button
                registerLink
                
                
                
            }
            
            
        
        }
    }
        

}

extension SignInView {
    var emailField: some View {
        TextField("", text: $email)
            .border(.black)
    }
    
    var passwordField: some View {
        SecureField("", text: $password)
            .border(.black)
    }
    
    var enterButton: some View {
        Button("Entrar") {
            print("enter button was tapped")
        }
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
                    .foregroundColor(.gray)
                     
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
