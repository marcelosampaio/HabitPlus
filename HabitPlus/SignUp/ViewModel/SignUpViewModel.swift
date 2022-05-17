//
//  SignUpViewModel.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 12/05/22.
//

import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
    
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var document = ""
    @Published var phone = ""
    @Published var birthday = ""
    @Published var gender = Gender.male
    
    var publisher: PassthroughSubject<Bool, Never>!
    
    @Published var uiState: SignUpUIState = .none
    
    func signUp() {
        self.uiState = .loading
        
        WebService.postUser(fullName: fullName,
                            email: email,
                            password: password,
                            document: document,
                            phone: phone,
                            birthday: birthday, // TODO: - Format from dd/MM/yyyy -> yyyy-MM-dd
                            gender: gender.index)
        
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.uiState = .success
//            self.publisher.send(true)
//        }
    }
    
}

extension SignUpViewModel {
    func homeView() -> some View {
        return SignUpViewRouter.makeHomeView()
    }
    

    
    
}
