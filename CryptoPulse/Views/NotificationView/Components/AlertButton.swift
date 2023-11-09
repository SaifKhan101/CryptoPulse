//
//  AlertButton.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 27/11/2023.
//

import SwiftUI

struct AlertButton: View {
    @Binding var buttonText: String
    var body: some View {
        Spacer()
        
            Text(buttonText)
                .font(.headline)
                .foregroundStyle(Color.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.theme.backgroundColor)
                .padding(.horizontal)
                .padding(.bottom)
                
        

    }
}

#Preview {
    AlertButton(buttonText: .constant("Add Alert"))
}
