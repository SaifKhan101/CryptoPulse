//
//  NotificationCoinsRowView.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 28/11/2023.
//

import SwiftUI

struct NotificationCoinsRowView: View {
    let coin: CoinModel
     var onNotificationCoinView: Bool
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            Spacer()
            righColumn
        }
    }
}

struct NotificationCoinsRowView_previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.accentColor.ignoresSafeArea()
            NotificationCoinsRowView(coin: dev.coin, onNotificationCoinView: false)
                .previewLayout(.sizeThatFits)
        }        
    }
}

extension NotificationCoinsRowView {
    private var leftColumn: some View {
        HStack(spacing: 0) {
        HStack {
            CoinImage(coin: coin)
                .frame(width: 30, height: 30)
                .padding(.leading, 4)
            VStack(alignment: .leading) {
                Text(coin.symbol.uppercased())
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .padding(.leading, 2)
               }
            }
        }
    }
    
    private var righColumn: some View {
        HStack {
            VStack(alignment: .trailing) {
                Text(coin.currentPrice.asCurrencywith6Decimals())
                    .bold()
                    .font(.system(size: 15))
                    .foregroundStyle(Color.white)
                Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                    .font(.system(size: 13))
                    .foregroundStyle(
                        (coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red
                    )
            }
            if onNotificationCoinView {
                Image(systemName: "star.fill")
                    .font(.title2)
                    .foregroundStyle(Color.theme.secondaryText)
                    .padding(.trailing)
            }
        }
    }
}
