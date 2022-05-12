//
//  EditTextView.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 12/05/22.
//

import SwiftUI

struct EditTextView: View {
    var body: some View {
        Text("EditTextView here")
    }
}

struct EditTextView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            value in
            EditTextView()
                .preferredColorScheme(value)
        }
        
    }
}
