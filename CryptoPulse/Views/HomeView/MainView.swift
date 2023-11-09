//
//  MainView.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 27/11/2023.
//

import SwiftUI

struct MainView: View {
    @State private var isSelected: Int = 0
    @State private var notifications: [NotifiacationModel] = []
    @EnvironmentObject var notificationData: NotificationData
    
    var body: some View {
        ZStack {
//            Color.accentColor
            VStack(spacing: 0) {                
                if isSelected == 0 {
                    HomeScreen()
                } else if isSelected == 1 {
                    NotificationView(notificaations: $notificationData.notifications, updateNotifications: {})
                }
                coustomtTabbar(isSelected: $isSelected)
                
            }
            .background(Color.accentColor)
            .environmentObject(notificationData)
        }
    }
}

#Preview {
    MainView()
}

