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
        
//        // Data entry - date from "dd/MM/yyyy" to Date
//        let formatter = DateFormatter()
//        formatter.locale = Locale(identifier: "en_US_POSIX")  // universal date pattern
//        formatter.dateFormat = "dd/MM/yyyy"
//        
//        let dateFormatted = formatter.date(from: birthday)
//        
//        guard let dateFormatted = dateFormatted else {
//            print("🌱 dateFormatted: \(String(describing: dateFormatted))")
//            self.uiState = .error("Data inválida: \(birthday)")
//            return
//        }
//
//        
//        // convert Date into "yyyy-MM-dd"
//        formatter.dateFormat = "yyyy-MM-dd"
//        let dateString = formatter.string(from: dateFormatted)

        
        
        
        WebService.postUser(request: SignUpRequest(fullName: fullName,
                                                   email: email,
                                                   password: password,
                                                   document: document,
                                                   phone: phone,
                                                   birthday: birthday.toDateString(),
                                                   gender: gender.index))

    }
    
}

extension SignUpViewModel {
    func homeView() -> some View {
        return SignUpViewRouter.makeHomeView()
    }
    

    
    
}
