//
//  Register.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 13/11/2023.
//

import SwiftUI


struct Register: View {
   
    var body: some View {
        ZStack {
            color
            VStack(spacing: 5) {
                loginText
                LogInTextFieldView()
                RegisterButtonView()
                Spacer()
            }
        }
    }
}

#Preview {
    Register()
}

extension Register {
    private var color: some View {
        RadialGradient(gradient: Gradient(colors: [Color("BackgroundColor"),  Color.accentColor]), center: .bottomTrailing, startRadius: 2, endRadius: 350).ignoresSafeArea()
    }
    private var loginText: some View {
        Text("Register")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .padding(.vertical)
    }
}


