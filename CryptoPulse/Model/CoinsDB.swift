//
//  CoinsDB.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 27/11/2023.
//

import Foundation
import SwiftData

@Model
class CoinsDB {
    var coinsId: String
    
    init(coinsId: String = "") {
        self.coinsId = coinsId
    }
}
