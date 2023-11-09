//
//  RegisterButtonView.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 13/11/2023.
//

import SwiftUI

struct RegisterButtonView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            registerButton
            Text("or login with")
                .foregroundStyle(Color.theme.walkthrough)
            googleLogo
        }
    }
}

#Preview {
    RegisterButtonView()
}

extension RegisterButtonView {
    private var registerButton: some View {
        NavigationLink {
            Walkthrough6()
        } label: {
            Text("Register")
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
