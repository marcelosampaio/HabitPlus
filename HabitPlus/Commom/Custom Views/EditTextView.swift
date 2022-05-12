//
//  EditTextView.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 12/05/22.
//

import SwiftUI

struct EditTextView: View {
    
    @Binding var text: String
    var placeholder: String = ""
    var keyboard: UIKeyboardType = .default
    var error: String? = nil
    var failure: Bool? = nil
    
    
    var body: some View {
        VStack {
            TextField(placeholder, text: $text)
                .foregroundColor(Color("textColor"))
                .keyboardType(keyboard)
                .padding(.horizontal, 8)
                .padding(.vertical, 16)
                .overlay(RoundedRectangle(cornerRadius: 8.0)
                    .stroke(Color.orange, lineWidth: 0.7)
                )
            
            if let error = error, failure == true, !text.isEmpty {
                Text(error).foregroundColor(.red)
            }
        }
    }
}

struct EditTextView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { value in
            
            VStack {
                
                EditTextView(text: .constant(""), placeholder: "Informe e-mail", error: "E-mail inválido", failure: "ab".count < 3)
                    .preferredColorScheme(value)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
            
        }
        
    }
}
