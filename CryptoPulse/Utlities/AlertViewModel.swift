//
//  AlertViewModel.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 04/12/2023.
//

import Foundation
import SwiftUI

class AlertViewModel: ObservableObject {
    
    
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    
    func showAlert(message: String) {
        alertMessage = message
        showAlert = true
    }
}
