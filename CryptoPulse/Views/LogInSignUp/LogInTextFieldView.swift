//
//  LogInTextFieldView.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 10/11/2023.
//

import SwiftUI

struct LogInTextFieldView: View {
    @State private var textFieldText = ""
    @State private var passwordText  = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            emailText
            emailTextFieldView
            passwordTextHeader
            passwordTextFieldView
            Text("Forget Password?")
                .foregroundStyle(Color.blue)
                .padding(.leading)
        }
    }
}

#Preview {
    ZStack {
        RadialGradient(gradient: Gradient(colors: [Color("BackgroundColor").opacity(0.9),  Color.accentColor]), center: .bottomTrailing, startRadius: 50, endRadius: 400).ignoresSafeArea()
        LogInTextFieldView()
    }
    
}

extension LogInTextFieldView {
    private var emailText: some View {
        Text("Email")
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(Color.white)
            .padding(.horizontal)
    }
    
    private var emailTextFieldView: some View {
        ZStack(alignment: .leading) {
            if textFieldText.isEmpty {
                Text("Enter your email")
                    .font(.headline)
                    .foregroundColor(Color.theme.walkthrough)
                    .padding(.horizontal, 28)
                    .padding(.vertical, 12)
            }
            
            TextField("", text: $textFieldText)
                .font(.headline)
                .foregroundStyle(Color.blue)
                .padding()
                .background(Color.black.opacity(0.8))
                .cornerRadius(10)
                .padding()
           
        }
    }
    
    private var passwordTextHeader: some View {
        Text("Password")
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(Color.white)
            .padding(.horizontal)
    }
    
    private var passwordTextFieldView: some View {
        ZStack(alignment: .leading) {
            if passwordText.isEmpty {
                HStack {
                    Text("Enter your password")
                        .font(.headline)
                        .foregroundColor(Color.theme.walkthrough)
                        .padding(.horizontal, 28)
                        .padding(.vertical, 12)
                    Spacer()
                    Image(systemName: "eye.slash.fill")
                        .font(.headline)
                        .foregroundStyle(Color.white)
                        .padding(.horizontal)
                        .padding(.trailing)
                }
            }
            
            TextField("", text: $passwordText)
                .font(.headline)
                .foregroundStyle(Color.blue)
                .padding()
                .background(Color.black.opacity(0.8))
                .cornerRadius(10)
                .padding()
        }
    }
}
