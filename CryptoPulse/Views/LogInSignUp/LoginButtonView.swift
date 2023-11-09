//
//  ButtonView.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 13/11/2023.
//

import SwiftUI

struct LogInButtonView: View {   
    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            loginButton
            Text("or login with")
                .foregroundStyle(Color.theme.walkthrough)
            googleLogo            
        }
    }
}

#Preview {
    ZStack {
        RadialGradient(gradient: Gradient(colors: [Color("BackgroundColor"),  Color.accentColor]), center: .bottomTrailing, startRadius: 0, endRadius: 300).ignoresSafeArea()
        LogInButtonView()
    }
}

extension LogInButtonView {
    private var loginButton: some View {
        NavigationLink {
            MainView()
        } label: {
            Text("Login")
                .foregroundStyle(Color.white)
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("BackgroundColor").opacity(0.9))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
                .padding(.top, 25)
        }
    }
    
    private var googleLogo: some View {
        NavigationLink {
            
        } label: {
               Image("Google")
                    .renderingMode(.original)
                    .font(.title)
        }
    }
}
