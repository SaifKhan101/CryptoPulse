//
//  HomeViewCoinRow.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 20/11/2023.
//

import SwiftUI

struct HomeViewCoinRow: View {
    let coin: CoinModel
    var body: some View {
        HStack {
            leftColumn
            midColumn
            Spacer()
            righColumn
        }       
    }
}

struct HomeViewCoinRow_previews: PreviewProvider {
    static var previews: some View {
        HomeViewCoinRow(coin: dev.coin)
            .previewLayout(.sizeThatFits)
    }
}
extension HomeViewCoinRow {
    private var leftColumn: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading) {
                Text(coin.symbol.uppercased())
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                    .foregroundStyle(
                        (coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red
                    )
                Text("\(coin.high24H!.asNumberString() )")
                    .foregroundStyle(
                        (coin.high24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red
                    )
               }
            }
        .padding(.leading)
    }
    
    private var righColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencywith6Decimals())
                .bold()
                .foregroundStyle(
                    (coin.currentPrice) >= 0 ? Color.theme.green : Color.theme.red
                )
        }
    }
    
    private var midColumn: some View {
        VStack {
            if let sparklineData = coin.sparklineIn7D {
                CoustomCharts(data: sparklineData.price!.map{CGFloat($0)}, coin: coin)
                    .padding(.leading, 50)
                
//                    .frame(height: 50)
//                    .scaledToFit()
//                    .scaledToFill()
                    
            } else {
                Text("No data available")
            }
        }
    }
}
