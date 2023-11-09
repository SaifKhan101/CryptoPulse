//
//  CryptoPulseApp.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 09/11/2023.
//

import SwiftUI

@main
struct CryptoPulseApp: App {
    @StateObject private var vm = HomeViewModel()
    @StateObject var notificaationData = NotificationData()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                TabViewBoarding()
                    .navigationTitle("")
                    .navigationBarHidden(true)
                    .navigationViewStyle(StackNavigationViewStyle())
            }
            .environmentObject(vm)
            .environmentObject(notificaationData)
        }
    }
}
