//
//  SignUpView.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 12/05/22.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var viewModel: SignUpViewModel
    
    var body: some View {
        // ------------
        ZStack {
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .center,spacing: 8){
                    VStack(alignment: .leading, spacing: 8) {
                        titleLabel
                        fullNameField
                        emailField
                        passwordField
                        documentField
                        phoneField
                        birthdayField
                        genderField
                        saveButton
                    }
                    Spacer()
                }.padding(.horizontal, 24)
            }
                .padding()
                .navigationBarTitleDisplayMode(.inline)
            
            if case SignUpUIState.error(let value) = viewModel.uiState {
                // generate an alert to the user
                Text("")
                    .alert(isPresented: .constant(true)) {
                        Alert(title: Text("HabitPlus"), message: Text("\(value)"), dismissButton: .default(Text("OK")) {
                            // on completion - in this cas doing nothing
                        })
                    }
            }
        }
    }
}


extension SignUpView {
    
    var titleLabel: some View {
        Text("Cadastro")
            .foregroundColor(Color("textColor"))
            .font(Font.system(.title).bold())
            .padding(.bottom, 8)
    }
}

extension SignUpView {
    var fullNameField: some View {
        
        EditTextView(text: $viewModel.fullName,
                     placeholder: "Nome",
                     keyboard: .alphabet,
                     error: "Informe o nome",
                     failure: viewModel.fullName.count < 3,
                     isSecure: false)

    }
    
    var emailField: some View {
        EditTextView(text: $viewModel.email,
                     placeholder: "E-mail",
                     keyboard: .emailAddress,
                     error: "Email inválido",
                     failure: !viewModel.email.isEmail(),
                     isSecure: false)
    }
}
 
extension SignUpView {
    var passwordField: some View {
        
        EditTextView(text: $viewModel.password,
                     placeholder: "Senha",
                     keyboard: .default,
                     error: "Senha deve ter ao menos 6 caracteres",
                     failure: viewModel.password.count < 6,
                     isSecure: true)
    }
}

extension SignUpView {
    var documentField: some View {
        EditTextView(text: $viewModel.document,
                     placeholder: "CPF",
                     keyboard: .numberPad,
                     error: "Informe o CPF",
                     failure: viewModel.document.count != 11,
                     isSecure: false)
    }
}
 
extension SignUpView {
    var phoneField: some View {
        EditTextView(text: $viewModel.phone,
                     placeholder: "Telefone",
                     keyboard: .numberPad,
                     error: "Informe DDD + 8 ou 9 dígitos",
                     failure: viewModel.phone.count < 10 || viewModel.phone.count > 11,
                     isSecure: false)
    }
}

extension SignUpView {
    var birthdayField: some View {
        
        EditTextView(text: $viewModel.birthday,
                     placeholder: "Data de nascimento",
                     keyboard: .default,
                     error: "Informe nascimento no formato DD/MM/AAAA",
                     failure: viewModel.birthday.count != 10,
                     isSecure: false)
    }
}
 
extension SignUpView {
    var genderField: some View {
        Picker("Gender", selection: $viewModel.gender) {
            ForEach(Gender.allCases, id: \.self) { value in
                Text(value.rawValue)
                    .tag(value)
            }
        }
        .pickerStyle(.segmented)
        .padding(.top, 16)
        .padding(.bottom, 48)
        
    }
}
 
extension SignUpView {
    var saveButton: some View {
        
        
        LoadingButtonView(
            action: {
                viewModel.signUp()
            },
            text: "Cadastrar",
            showProgress: self.viewModel.uiState == SignUpUIState.loading,
            disabled: !viewModel.email.isEmail() ||
            viewModel.password.count < 6 ||
            viewModel.fullName.count < 3 ||
            viewModel.document.count != 11 ||
            viewModel.phone.count < 10 || viewModel.phone.count > 11 ||
            viewModel.birthday.count != 10
        )

    }

}





struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { value in
            let viewModel = SignUpViewModel()
            SignUpView(viewModel: viewModel)
                .preferredColorScheme(value)
        }
    }
}
