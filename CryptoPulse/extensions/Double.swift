//
//  Double.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 15/11/2023.
//

import Foundation
import SwiftUI

extension Double {
    
    /// Converts a Double into  a currency with 2  decimal points
    /// ```
        /// Converts 1234.56 to $1,234.56
        /// ```
        
        private var currencyFormatter2: NumberFormatter {
            let formatter = NumberFormatter()
            formatter.usesGroupingSeparator = true
            formatter.numberStyle = .currency
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
            return formatter
        }
        
        /// Converts a Double into  a currency
        /// ```
            /// Converts 1234.56 to $1,234.56
            /// ```
        func asCurrencywith2Decimals() -> String {
            let number = NSNumber(value: self)
            return currencyFormatter2.string(from: number) ?? "$0.00"
        }
/// Converts a Double into  a currency with 2 to 6 decimal points
/// ```
    /// Converts 1234.56 to $1,234.56
    /// Converts 12.3456 to $12.2356
    /// Converts 0.123456 to $0.123456
    /// ```
    
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    /// Converts a Double into  a currency
    /// ```
        /// Converts 1234.56 to $1,234.56
        /// ```
    func asCurrencywith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    /// Converts a Double into  a 2 decimal places
    /// ```
        /// Converts 1234.56 to $1,234.56
        /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    /// Converts a Double into  a percentage
    /// ```
        /// Converts 1234.56 to $1,234.56%
        /// ```
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
}
