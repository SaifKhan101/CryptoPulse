//
//  DropDownMenuListRow.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 30/11/2023.
//

import SwiftUI

struct DropDownMenuListRow: View {
    let option: DropDownMenuOption
    let onSelectedAction: (_ option: DropDownMenuOption) -> Void
    var body: some View {
        VStack(spacing: 0) {
            Button {
                self.onSelectedAction(option)
            } label: {
                Text(option.option)
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 55)
            .padding(.leading)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(
                        Color.white.opacity(0.1)
                    )
            )
            .padding(.horizontal)   
        }
    }
}

#Preview {
    
    ZStack {
        Color.accentColor
        DropDownMenuListRow(option: DropDownMenuOption.selectOneOption, onSelectedAction: { _ in
            
        })
    }
}
