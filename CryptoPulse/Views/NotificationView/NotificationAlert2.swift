//
//  NotificationAlert2.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 01/12/2023.
//

import SwiftUI

struct NotificationAlert2: View {
    
    @EnvironmentObject var notificationData: NotificationData
    @Environment(\.presentationMode) var presentationMode
    @State private var alertButtonText = "Add Alert"
    @State private var updatedPrice: Double = 0.0
    
    let alertType: String
    let frequency: DropDownMenuOption
    let textFieldText: String
    let coin: CoinModel
    
//    var updateNotifications: () -> Void
    
    var body: some View {
        ZStack {
            Color.accentColor.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20) {
                header
                    .padding(.bottom, 30)
                coinView
                Divider()
                VStack(alignment: .leading, spacing: 4) {
                    SecondRowView
                    Text(frequency.option)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.theme.backgroundColor)
                        )
                        .padding(.leading)
                }
                Spacer()
                NavigationLink {
                    MainView()
                } label: {
                    AlertButton(buttonText: $alertButtonText)
                }
            }
        }
        .onAppear {
            if let price = Double(textFieldText) {
                updatedPrice = (coin.currentPrice ) + price
            } else {
                updatedPrice = (coin.currentPrice)
            }
            let notification = NotifiacationModel(alertType: alertType, updatedPrice: updatedPrice, coin: coin)
            notificationData.notifications.append(notification)
            
        }
        //        .navigationTitle("")
        .toolbar(.hidden)
        
    }
}

struct NotificationAlert2_previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NotificationAlert2(alertType: "", frequency: DropDownMenuOption.selectOneOption, textFieldText: "", coin: dev.coin)
                .environmentObject(dev.homeVM)
        }
    }
}

extension NotificationAlert2 {
    private var header: some View {
        HStack {
            Image(systemName: "arrow.backward")
                .font(.headline)
                .foregroundStyle(Color.theme.secondaryText)
                .padding(.leading)
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
            Spacer()
            
            Text("Create Alert")
                .font(.headline)
                .foregroundStyle(.white)
            Spacer()
        }
    }
    private var coinView: some View {
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
                Spacer()
                VStack(alignment: .trailing) {
                    Text("0")
                        .foregroundStyle(.white)
                    
                    Text("0.0")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    
                }
                .padding(.trailing)
            }
        }
    }
    private var SecondRowView: some View {
        HStack {
            Text(alertType)
                .foregroundStyle(.white)
            
            Text(String(format: "%.2f", updatedPrice))
                .foregroundStyle(.white)
            
            Spacer()
            Image(systemName: "trash")
                .foregroundStyle(.gray)
            
        }
        .padding(.horizontal)
    }
}


