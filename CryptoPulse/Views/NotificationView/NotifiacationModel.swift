//
//  NotifiacationModel.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 04/12/2023.
//

import Foundation

struct NotifiacationModel: Identifiable {
    let id = UUID()
    let alertType: String
    let updatedPrice: Double
    let coin: CoinModel
}

class NotificationData: ObservableObject {
    @Published var notifications: [NotifiacationModel] = []
}
