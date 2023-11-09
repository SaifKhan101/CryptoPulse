//
//  HomeButtonView.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 15/11/2023.
//

import SwiftUI

struct CircleButtonView: View {
     let width: CGFloat
     let height: CGFloat
    var body: some View {
            Image(systemName: "plus")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(Color.white)
                .frame(width: width, height: height)
                .background(
                     Circle()
                        .fill(Color.theme.backgroundColor)
                )
                .shadow(color: Color.white, radius: 10, x: 0.0, y: 0.0)
    }
}

#Preview {
    CircleButtonView(width: 50, height: 50)
        .previewLayout(.sizeThatFits)
}
