//
//  NotificationRowView.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 04/12/2023.
//

import SwiftUI

struct NotificationRowView: View {
    let notifications: NotifiacationModel
    
    var body: some View {
        HStack {
            CoinImage(coin: notifications.coin)
                .frame(width: 70, height: 70)
                .padding(.leading, 6)
            VStack(alignment: .leading) {
                HStack {
                    Text(notifications.coin.name)
                        .font(.headline)
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.1)
                    if containsAlertTypeKeyword(alertType: notifications.alertType) {
                        Text("Price Alert")
                            .fontWeight(.heavy)
                            .foregroundStyle(.white)
                            .lineLimit(1)
                            .minimumScaleFactor(0.1)
                    } else {
                        Text(notifications.alertType)
                            .fontWeight(.heavy)
                            .foregroundStyle(.white)
                            .lineLimit(1)
                            .minimumScaleFactor(0.1)
                    }
                }
                if containsAlertTypeKeyword(alertType: notifications.alertType) && notifications.coin.priceChangePercentage24H ?? 0 > 0 {
                    Text(notifications.coin.name)
                    +
                    Text(" has hit to ")
                        .foregroundStyle(.gray)
                    +
                    Text(notifications.coin.priceChangePercentage24H?.asNumberString() ?? "0.5")
                        .foregroundStyle(.green)
                    +
                    Text(" it is now ")
                        .foregroundStyle(.gray)
                    +
                    Text("\(notifications.coin.currentPrice.asNumberString())")
                } else if containsAlertTypeKeyword(alertType: notifications.alertType) && notifications.coin.priceChangePercentage24H ?? 0 < 0 {
                    Text(notifications.coin.name)
                    +
                    Text(" has hit to ")
                        .foregroundStyle(.gray)
                    +
                    Text(notifications.coin.priceChangePercentage24H?.asNumberString() ?? "0.5")
                        .foregroundStyle(.red)
                    +
                    Text(" it is now ")
                        .foregroundStyle(.gray)
                    +
                    Text("\(notifications.coin.currentPrice.asNumberString())")
                } else if containsAlertTypeKeyword(alertType: notifications.alertType) && notifications.coin.priceChangePercentage24H ?? 0 > 0 {
                    Text(notifications.coin.name)
                    +
                    Text(" has hit to ")
                        .foregroundStyle(.gray)
                    +
                    Text(notifications.coin.priceChangePercentage24H?.asNumberString() ?? "0.5")
                        .foregroundStyle(.green)
                    +
                    Text(" it is now ")
                        .foregroundStyle(.gray)
                    +
                    Text("\(notifications.coin.currentPrice.asNumberString())")
                } else if notifications.alertType.localizedCaseInsensitiveContains("Daily Balance Movement") {
                    Text("you have'nt bought the coin, so currently you have no balance")
                        .foregroundStyle(.gray)
                } else if containsRemaningAlertTypeKeyword(alertType: notifications.alertType) {
                    Text("A mantainence is going to take place")
                        .foregroundStyle(.gray)
                }
                
            }
            .padding(.leading)
            Spacer()
        }
    }
    func containsAlertTypeKeyword(alertType: String) -> Bool {
        let keywords = ["Price reaches", "Price rises above", "Percentage increase", "Volume increase"]
        return keywords.contains { alertType.contains($0) }
    }
    
    func containsRemaningAlertTypeKeyword(alertType: String) -> Bool {
        let keywords = ["Change is over", "Change is under"]
        return keywords.contains {alertType.contains($0)}
//        return keywords.contains { alertType.contains($0) }
    }
}

struct NotificationRowView_previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ZStack {
                Color.accentColor.ignoresSafeArea()
                NotificationRowView(notifications: NotifiacationModel(alertType: "", updatedPrice: 0.0, coin: dev.coin))
                    .environmentObject(dev.homeVM)
            }
        }
    }
}
