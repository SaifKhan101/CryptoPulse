//
//  Walkthrough3.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 11/11/2023.
//

import SwiftUI

struct Walkthrough3: View {
    var body: some View {
        ZStack {
            Color.accentColor.ignoresSafeArea()
            VStack {
                image
                textView
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EmptyView()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EmptyView()
                    }
                }
    }
}
#Preview {
    Walkthrough3()
}

extension Walkthrough3 {
    private var image: some View {
        Image("image5")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
        
    }
    
    private var textView: some View {
        VStack(alignment: .center) {
            Rectangle()
                .fill(Color("BackgroundColor").opacity(0.5))
                .frame(width: 80, height: 4)
            Text("""
Set Coustom
Notifications
""")
                .font(.title)
                .fontWeight(.regular)
                .foregroundStyle(Color.white)
                .multilineTextAlignment(.center)
            
            Text("Set coustom notifications to be notified about rise and fall of crpto currencies")
                .foregroundStyle(Color.gray)
                .multilineTextAlignment(.center)
                .padding(14)
                .padding(.horizontal)
        }
    }
}
