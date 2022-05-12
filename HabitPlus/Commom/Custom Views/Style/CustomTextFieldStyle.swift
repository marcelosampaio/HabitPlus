//
//  CustomTextFieldStyle.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 12/05/22.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .foregroundColor(Color("textColor"))
            .padding(.horizontal, 8)
            .padding(.vertical, 16)
            .overlay(RoundedRectangle(cornerRadius: 8.0)
                .stroke(Color.orange, lineWidth: 0.7)
            )
    }
}
