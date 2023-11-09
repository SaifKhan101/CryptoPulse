//
//  NavBarView.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 16/11/2023.
//

import SwiftUI


struct coustomtTabbar: View {
    @Binding var isSelected: Int
    var body: some View {
        Spacer()
        HStack {            
            Button(action: {
                isSelected = 0
            }, label: {
                Image(systemName: "bag.fill")
                    .foregroundStyle(
                        (isSelected == 0) ? Color.theme.backgroundColor : Color.theme.walkthrough
                    )
            })
            Spacer()
            Button(action: {
                isSelected = 1
            }, label: {
                Image(systemName: "bell.fill")
                    .foregroundStyle(
                        (isSelected == 1) ? Color.theme.backgroundColor : Color.theme.walkthrough
                    )
            })
            Spacer()
            Button(action: {
                isSelected = 2
            }, label: {
                Image(systemName: "gearshape.fill")
                    .foregroundStyle(
                        (isSelected == 2) ? Color.theme.backgroundColor : Color.theme.walkthrough
                    )
            })
        }
        .font(.title)
        .padding(.horizontal)
        .padding()
        .background(Color.black)
    }
}

struct NavBar_previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            coustomtTabbar(isSelected: .constant(0))
                
        }
    }
}
