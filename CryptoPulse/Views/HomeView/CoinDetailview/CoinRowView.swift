//
//  CoinRowModel.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 15/11/2023.
//

import SwiftUI

struct CoinRowView: View {
    let coin: CoinModel
    @Binding var isOnHomeView: Bool
    var body: some View {
        HStack(spacing: 0) {            
            leftColumn            
            Spacer()
            righColumn
        }    
    }
}
struct CoinRowView_previews: PreviewProvider {
    static var previews: some View { 
        ZStack {
            Color.accentColor
            CoinRowView(coin: dev.coin, isOnHomeView: .constant(true))
                .previewLayout(.sizeThatFits)
        }
    }
}

extension CoinRowView {
    private var leftColumn: some View {
        HStack(spacing: 0) {
        Text("\(coin.rank)")
            .font(.caption)
            .foregroundStyle(Color.theme.secondaryText)
            .frame(minWidth: 30)
        HStack {
            CoinImage(coin: coin)
                .frame(width: 40, height: 50)
            VStack(alignment: .leading) {
                Text(coin.id.capitalized)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .foregroundStyle(Color.theme.walkthrough)
                    .padding(.leading, 6)
               }
            }
        }
    }
    
    private var righColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencywith6Decimals())
                .bold()
                .foregroundStyle(Color.white)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundStyle(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red
                )
        }
    }
}
