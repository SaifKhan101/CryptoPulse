//
//  LogIn.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 10/11/2023.
//

import SwiftUI

struct LogIn: View {
    var body: some View {
            ZStack {
                color
                VStack(spacing: 5) {
                    loginText
                    LogInTextFieldView()
                    LogInButtonView()
                    Spacer()
            }
        }
        
    }
}
#Preview {
    LogIn()
}

extension LogIn {
    private var color: some View {
        RadialGradient(gradient: Gradient(colors: [Color("BackgroundColor"),  Color.accentColor]), center: .bottomTrailing, startRadius: 2, endRadius: 350).ignoresSafeArea()
    }
    
    private var loginText: some View {
        Text("Login")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .padding(.vertical)
    }
}

