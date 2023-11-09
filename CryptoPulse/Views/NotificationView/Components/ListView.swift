//
//  ListView.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 29/11/2023.
//

import SwiftUI

struct ListView: View {
    
    var options = ["Price reaches", "Price rises above", "Percentage increase ", "Volume increase", "Daily Balance Movement", "Change is over", "Change is under"]
    @State private var selectedItem: Int = 1
    @Binding var selectedAlertType: String
    var body: some View {
            VStack {
                HStack {
                    Text("Select alert")
                        .foregroundStyle(.white)
                        .padding(.leading)
                    Spacer()
                    Picker("", selection: $selectedAlertType) {
                        ForEach(options, id: \.self) { option in
                            Text(option)
                                .tag(option)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .tint(.white)
                    .padding(.horizontal)
                }
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(Color.white.opacity(0.1))
            .padding(.horizontal)
    }
}

#Preview {
    ListView( selectedAlertType: .constant(""))
}
