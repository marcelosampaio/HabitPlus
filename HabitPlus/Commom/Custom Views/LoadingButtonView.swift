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
    var text: String
    var showProgress: Bool = false
    var disabled: Bool = false
    
    var body: some View {
        ZStack {
            // 📍 Button
            Button {
                // button was tapped
                action()
                print("📍 button was tapped")
            } label: {
                Text(showProgress ? "" : text )
                    .frame(maxWidth: 184)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 16)
                    .font(Font.system(.title3).bold())
                    .background(disabled ? Color("lightOrange") : .orange)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(disabled || showProgress)
            
            
            // ProgressView
            ProgressView()
                .progressViewStyle(.circular)
                .opacity(showProgress ? 1 : 0)
            
        }
    }
}

struct LoadingButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { value in
            VStack {
                LoadingButtonView(action: {
                    print("📍 LoadingButtonView_Previews")
                },
                text: "Custom text",
                showProgress: false,
                disabled: false)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .preferredColorScheme(value)
        }

    }
}
