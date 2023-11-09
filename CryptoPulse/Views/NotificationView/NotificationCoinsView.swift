//
//  NotificationCoinsView.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 28/11/2023.
//

import SwiftUI

struct NotificationCoinsView: View {
    @EnvironmentObject var vm: HomeViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedCoin: CoinModel? = nil
    @State private var showCoinAlertView: Bool = false
    private let onNotificationCoinVeiw: Bool = true
    private let searchBarHeight: CGFloat = 35
    var body: some View {
        ZStack {
            color
            VStack {
                HStack {
                    SearchBarView(searchText: $vm.searchText, searchBarHeight: searchBarHeight)
                    Text("Cancel")
                        .foregroundStyle(.white)
                        .padding(.trailing)
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                    }
                }
                listView
                Spacer()
            }
        }
        .background(
            NavigationLink("", destination: NotificationAlertView(coin: selectedCoin), isActive: $showCoinAlertView)
                .opacity(0)
                
        )
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct NotificationCoinsView_previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NotificationCoinsView()
                .environmentObject(dev.homeVM)
        }
    }
}


extension NotificationCoinsView {
    private var color: some View {
        RadialGradient(gradient: Gradient(colors: [Color("BackgroundColor").opacity(0.8),  Color.accentColor]), center: .bottomTrailing, startRadius: 2, endRadius: 100).ignoresSafeArea()
    }
    
    private var listView: some View {
        List {
            ForEach(vm.allCoins) { coin in
                NotificationCoinsRowView(coin: coin, onNotificationCoinView: onNotificationCoinVeiw)
                    .onTapGesture {
                        selectedCoin = coin
                        showCoinAlertView.toggle()
                    }
               
            }
            .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
            .listRowSeparator(.visible)
            .listRowBackground(Color.accentColor)
        }
        .listStyle(.plain)
    }
}
