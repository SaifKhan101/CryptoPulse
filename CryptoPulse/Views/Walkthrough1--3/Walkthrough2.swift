//
//  Walkthrough2.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 10/11/2023.
//

import SwiftUI


struct Walkthrough2: View {
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                RadialGradient(gradient: Gradient(colors: [Color("BackgroundColor"), Color.accentColor]), center: .topLeading, startRadius: 5, endRadius: 420)
                .ignoresSafeArea()
                VStack(spacing: 12) {
                    Image("image6")
                        .resizable()
                        .imageScale(.medium)
                        .frame(maxWidth: .infinity)
                        .frame(height: geometry.size.height * 0.68)
                        .ignoresSafeArea()
                    
                    textView
                }
            }
        }
        .navigationTitle("")
        .toolbar(.hidden)
    }
}
 
#Preview {
    Walkthrough2()
}

extension Walkthrough2 {
    private var textView: some View {
        VStack(alignment: .center, spacing: 6) {
            Rectangle()
                .fill(Color("BackgroundColor").opacity(0.5))
                .frame(width: 80, height: 3)
            
            Text("""
Monitor Crypto
Currencies
""")
            .font(.title)
            .fontWeight(.regular)
            .foregroundStyle(Color.white)
            .multilineTextAlignment(.center)
            
            Text("Our engine provides the real time monitoring of crypto currencies so you are always up to date. ")
                .font(.headline)
                .foregroundStyle(Color.gray)
                .multilineTextAlignment(.center)
                .padding()
                .padding(.horizontal)
          }
    }
}
