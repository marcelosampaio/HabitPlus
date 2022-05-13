//
//  SignUpView.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 12/05/22.
//

import SwiftUI

struct SignUpView: View {
    
    @State var fullName = ""
    @State var email = ""
    @State var password = ""
    @State var document = ""
    @State var phone = ""
    @State var birthday = ""
    @State var gender = Gender.male
    
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
            }.padding()
            
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
        
        EditTextView(text: $fullName,
                     placeholder: "Nome",
                     keyboard: .default,
                     error: "Informe o nome",
                     failure: fullName.count < 3,
                     isSecure: false)

    }
    
    var emailField: some View {
        EditTextView(text: $email,
                     placeholder: "E-mail",
                     keyboard: .emailAddress,
                     error: "Email inválido",
                     failure: !email.isEmail(),
                     isSecure: false)
    }
}
 
extension SignUpView {
    var passwordField: some View {
        
        EditTextView(text: $password,
                     placeholder: "Senha",
                     keyboard: .default,
                     error: "Senha deve ter ao menos 6 caracteres",
                     failure: password.count < 6,
                     isSecure: true)
    }
}

extension SignUpView {
    var documentField: some View {
        TextField("CPF", text: $document)
            .padding(.top, 16)
    }
}
 
extension SignUpView {
    var phoneField: some View {
        TextField("Telefone", text: $phone)
            .padding(.top, 16)
            .keyboardType(.numberPad)
    }
}

extension SignUpView {
    var birthdayField: some View {
        TextField("Data de nascimento", text: $birthday)
            .padding(.top, 16)
    }
}
 
extension SignUpView {
    var genderField: some View {
        Picker("Gender", selection: $gender) {
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
        Button("Cadastrar") {
            print("SignUpView - enter button was tapped")
            viewModel.signUp()
        }
        .font(Font.system(.title).bold())
        
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
