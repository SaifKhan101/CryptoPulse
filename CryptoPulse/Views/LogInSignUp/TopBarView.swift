//
//  TopBarView.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 13/11/2023.
//

import SwiftUI

struct TopBarView: View {
   @Binding var selectedTab: Int
    var body: some View {
        HStack(spacing: 0) {
            ButtonView
            Button2View
        }
        .frame(maxWidth: .infinity)
        .frame(height: 46)
        .background(Color.white.opacity(0.1))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

#Preview {
    ZStack {
        Color.accentColor
        TopBarView(selectedTab: .constant(1))
    }
}

extension TopBarView {
    private var ButtonView: some View {
        Button(action: {
            self.selectedTab = 0
        }, label: {
            Text("Login")
                .font(.headline)
                .frame(width: UIScreen.main.bounds.width / 2.2, height: 40)
                .background(self.selectedTab == 0 ? Color.accentColor : Color.clear )
                .clipShape(RoundedRectangle(cornerRadius: 10))
        })
        .foregroundStyle(self.selectedTab == 0 ? Color.white : Color.gray)
    }
    
    private var Button2View: some View {
        Button(action: {
            self.selectedTab = 1
        }, label: {
            Text("Register")
                .font(.headline)
                .frame(width: UIScreen.main.bounds.width / 2.3, height: 40)
                .background(self.selectedTab == 1 ?Color.accentColor : Color.clear )
                .clipShape(RoundedRectangle(cornerRadius: 10))
        })
        .foregroundStyle(self.selectedTab == 1 ? Color.white : Color.gray)
    }
}
