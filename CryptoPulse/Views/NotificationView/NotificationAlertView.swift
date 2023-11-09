//
//  NotificationAlertView.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 28/11/2023.
//

import SwiftUI

struct NotificationAlertView: View {
    @EnvironmentObject var vm: HomeViewModel
    @Environment(\.dismiss) var dismiss
    @State private var selectedCoin: CoinModel? = nil
     private let onNotificationCoinVeiw: Bool = false
    @State private var textFieldText: String = ""
    @State private var alertButton: String = "Create Alert"
    @State private var selectedAlertType: String = "Select alert"
    @State private var selectedFrequency: DropDownMenuOption? = nil

    let coin: CoinModel?
    var body: some View {
        ZStack {
            Color.accentColor.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20) {
                header
                .padding(.bottom, 25)
                NotificationCoinsRowView(coin: coin!, onNotificationCoinView: onNotificationCoinVeiw)
                    textFields
                Spacer()
                NavigationLink {
                    NotificationAlert2( alertType: selectedAlertType, frequency: selectedFrequency ?? DropDownMenuOption.selectOneOption, textFieldText: textFieldText, coin: coin!) //updateNotifications: {

//                        let newNotification = NotifiacationModel(alertType: selectedAlertType, updatedPrice: 0.0, coin: coin!)
//                        notificationData.notifications.append(newNotification)
//                    })
                } label: {
                    AlertButton(buttonText: $alertButton)
                }
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
   
}

struct NotificationAlertView_previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NotificationAlertView(coin: dev.coin )
                .environmentObject(dev.homeVM)
        }
    }
}

extension NotificationAlertView {
    private var header: some View {
        HStack {
            Image(systemName: "arrow.backward")
                .font(.headline)
                .foregroundStyle(Color.theme.secondaryText)
                .padding(.leading)
                .onTapGesture {
                    dismiss.callAsFunction()
                }
            Spacer()
            
            Text("Create Alert")
                .font(.headline)
                .foregroundStyle(.white)
            Spacer()
        }
    }
    
    private var textFields: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Alert Type")
                .foregroundStyle(.white)
                .padding(.horizontal)
                .padding(.top, 30)
            
            ListView(selectedAlertType: $selectedAlertType)
               
        Text("Value")
            .foregroundStyle(.white)
            .padding(.horizontal)
            NotificationTextField(textFieldText: $textFieldText)
        
        Text("Frequency")
            .foregroundStyle(.white)
            .padding(.horizontal)
        
            FrequecyDropDownView(selectedFrequency: $selectedFrequency)
        }
    }
}
