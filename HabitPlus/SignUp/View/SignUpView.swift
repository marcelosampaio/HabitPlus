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
            .foregroundColor(.black)
            .font(Font.system(.title).bold())
            .padding(.bottom, 8)
    }
    
    var fullNameField: some View {
        TextField("Informe nome completo", text: $fullName)
            .padding(.top, 16)
    }
    
    var emailField: some View {
        TextField("sadss", text: $email)
            .padding(.top, 16)
            .keyboardType(.emailAddress)
    }
    
    var passwordField: some View {
        SecureField("Informe senha", text: $password)
            .padding(.top, 24)
    }
    
    var documentField: some View {
        TextField("Informe documento", text: $document)
            .padding(.top, 16)
    }
    
    var phoneField: some View {
        TextField("Informe telefone", text: $phone)
            .padding(.top, 16)
            .keyboardType(.numberPad)
    }
    
    var birthdayField: some View {
        TextField("Informe data de nascimento", text: $birthday)
            .padding(.top, 16)
    }
    
    
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
        SignUpView(viewModel: SignUpViewModel())
    }
}
