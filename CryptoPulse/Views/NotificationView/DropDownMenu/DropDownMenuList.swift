//
//  DropDownMenuList.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 30/11/2023.
//

import SwiftUI

struct DropDownMenuList: View {
    let options: [DropDownMenuOption]
    let onSelectedAction: (_ option: DropDownMenuOption) -> Void
    @Binding var isOptionPresented: Bool
    let headerText: String
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0) {   
                header
                ForEach(options) { option in
                    DropDownMenuListRow(option: option, onSelectedAction: self.onSelectedAction)
                    Divider()
                }
                cancelButton
            }
        }
        
        .frame(height: CGFloat(self.options.count * 32) > 300
        ? 300
               : CGFloat(self.options.count * 32)
        )
        .padding(.vertical, 5)
        .background(
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.accentColor)
                .padding(.horizontal)
        )
//        .overlay {
//            RoundedRectangle(cornerRadius: 5)
//                .stroke(.gray, lineWidth: 1)
//                .padding(.horizontal)
//        }
        
    }
}

#Preview {
    DropDownMenuList(options: DropDownMenuOption.allOptions, onSelectedAction: { _ in
        
    }, isOptionPresented: .constant(true), headerText: "Alert type")
}

extension DropDownMenuList {
    private var header: some View {
        HStack {
            Text(headerText)
                .padding(.leading)
                .padding()
                .foregroundStyle(Color.white)
            Spacer()
            Button(action: {
                isOptionPresented.toggle()
            }, label: {
                Image(systemName: "xmark.circle")
                    .font(.system(size: 22))
                    .padding(.trailing)
                    .foregroundStyle(Color.white)
                    
            })
        }
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.1))
        .padding(.horizontal, 17)
    }
    
    private var cancelButton: some View {
        VStack {
            Button {
                isOptionPresented.toggle()
            } label: {
                Text("Cancel")
                    .foregroundStyle(.white)
                    .padding()
            }
            .frame(maxWidth: .infinity)
            .overlay {
                Rectangle()
                    .stroke(.white, lineWidth: 1.5)
            }
            .padding(22)
        }
    }
}
