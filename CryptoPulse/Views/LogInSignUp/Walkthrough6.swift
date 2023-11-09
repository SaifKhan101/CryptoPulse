//
//  Walkthrough6.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 13/11/2023.
//

import SwiftUI

struct Walkthrough6: View {
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("BackgroundColor"), Color.accentColor]), center: .topLeading, startRadius: 5, endRadius: 420)
                .ignoresSafeArea()
            
            Image("Walkthrough 6")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }
    }
}

#Preview {
    Walkthrough6()
}
