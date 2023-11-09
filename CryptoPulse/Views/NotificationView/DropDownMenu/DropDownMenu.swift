//
//  DropDownMenu.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 30/11/2023.
//

import SwiftUI

struct DropDownMenu: View {
    @State private var isPopOverPresented: Bool = false
    @State private var showDropdownList: Bool   = false
    @State private var isOptionPresented: Bool  = false
    @Binding var selectedOption: DropDownMenuOption?
    let placeholder: String
    let options: [DropDownMenuOption]
    let headerText: String
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    self.isPopOverPresented.toggle()
                    self.isOptionPresented.toggle()
                    
                }
            }, label: {
                HStack {
                    Text((selectedOption == nil ? placeholder : selectedOption?.option) ?? "")
                        .fontWeight(.medium)
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Image(systemName: self.isOptionPresented ? "chevron.up" : "chevron.down")
                        .fontWeight(.medium)
                        .foregroundStyle(.black)
                }
            })
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.white.opacity(0.1))
                //                .stroke(.gray, lineWidth: 1)
            )
            .overlay(alignment: .top, content: {
                
//                GeometryReader { geometry in 
                    VStack {
                        if self.isOptionPresented {
                            Spacer(minLength: 60)
                            DropDownMenuList(options: self.options, onSelectedAction: { option in
                                self.isOptionPresented = false
                                self.selectedOption = option
                            }, isOptionPresented: $isOptionPresented, headerText: headerText)
                            .background(Color.accentColor)
                        }
                           
                    }
                    
            })
            .padding(.horizontal)
            
            //        .overlay(alignment: .top) {
            //            VStack {
            //                if self.isOptionPresented {
            //                    Spacer(minLength: 60)
            //                    DropDownMenuList(options: self.options, onSelectedAction: { option in
            //                        self.isOptionPresented = false
            //                        self.selectedOption = option
            //                    }, isOptionPresented: $isOptionPresented, headerText: headerText)
            //                }
            //            }
            //        }
            //        .padding(.horizontal)
        }
        .zIndex(1)
    }
}

#Preview {
    ZStack {
        Color.accentColor
        DropDownMenu(selectedOption: .constant(nil), placeholder: "Enter here", options: DropDownMenuOption.allOptions, headerText: "Alert type")
    }
}
