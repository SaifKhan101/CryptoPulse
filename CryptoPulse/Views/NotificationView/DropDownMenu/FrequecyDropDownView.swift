//
//  FrequecyDropDownView.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 01/12/2023.
//

import SwiftUI

struct FrequecyDropDownView: View {
    @State private var options: DropDownMenuOption? = nil
    @Binding var selectedFrequency: DropDownMenuOption?
    var body: some View {
        DropDownMenu(selectedOption: $options, placeholder: "Enter here..", options: DropDownMenuOption.frequencyOptions, headerText: "Frequency")
            .onChange(of: options) { newValue in
                            selectedFrequency = newValue
                        }
    }
}

#Preview {
    FrequecyDropDownView(selectedFrequency: .constant(DropDownMenuOption.selectOneOption))
}
