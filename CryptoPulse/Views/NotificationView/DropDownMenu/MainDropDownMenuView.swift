//
//  MainDropDownMenuView.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 30/11/2023.
//

import SwiftUI

struct MainDropDownMenuView: View {
    @State private var options: DropDownMenuOption? = nil
    var body: some View {
        VStack {
            DropDownMenu(selectedOption: $options, placeholder: "Enter here..", options: DropDownMenuOption.allOptions, headerText: "Alert Type")
        }
    }
}

#Preview {
    MainDropDownMenuView()
}
