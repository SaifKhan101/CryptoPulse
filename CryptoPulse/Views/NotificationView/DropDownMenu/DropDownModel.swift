//
//  DropDownModel.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 30/11/2023.
//

import Foundation

struct DropDownMenuOption: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
}

extension DropDownMenuOption {
    static let selectOneOption: DropDownMenuOption = DropDownMenuOption(option: "Price rise")
    static let allOptions: [DropDownMenuOption] = [
    DropDownMenuOption(option: "Price reaches"),
    DropDownMenuOption(option: "Price rises above"),
    DropDownMenuOption(option: "Percentage increase"),
    DropDownMenuOption(option: "Volume Increase"),
    DropDownMenuOption(option: "Daily balance movement"),
    DropDownMenuOption(option: "Change is over"),
    DropDownMenuOption(option: "Change is under")
    ]
    static let frequencyOptions: [DropDownMenuOption] = [
    DropDownMenuOption(option: "Only Once"),
    DropDownMenuOption(option: "Once a day"),
    DropDownMenuOption(option: "Always"),
    DropDownMenuOption(option: "Custom")
    ]
}
