//
//  LoadingButtonView.swift
//  HabitPlus
//
//  Created by Marcelo Sampaio on 12/05/22.
//

import SwiftUI

struct LoadingButtonView: View {
    
    // takes functions as parameters.
    var action: () -> Void
    var showProgress: Bool = false
    var disabled: Bool = false
    
    var body: some View {
        ZStack {
            Button {
                // button was tapped
                action()
                print("📍 button was tapped")
            } label: {
                Text("Button")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 16)
                    .font(Font.system(.title3).bold())
                    .background(disabled ? Color("lightOrange") : .orange)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(disabled || showProgress)
        }
    }
}

struct LoadingButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { value in
            VStack {
                LoadingButtonView(action: {
                    print("📍 LoadingButtonView_Previews")
                }, showProgress: false, disabled: false)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .preferredColorScheme(value)
        }

    }
}
