//
//  NotificationTextField.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 28/11/2023.
//

import SwiftUI

struct NotificationTextField: View {
    @Binding var textFieldText: String
   
    var body: some View {
        HStack {
            if textFieldText.isEmpty {
                Text("Enter here")
                    .bold()
                    .foregroundStyle(Color.theme.walkthrough)
                    .padding(.leading)
            }
            TextField("", text: $textFieldText)
                .font(.headline)
                .padding(14)
                
        }
        .background(
        Rectangle()
            .fill(Color.white.opacity(0.1))
        )
        .padding(.horizontal)
    }
}

#Preview {
    NotificationTextField(textFieldText: .constant(""))
}
