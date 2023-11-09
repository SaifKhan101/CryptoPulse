//
//  duplicate.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 13/11/2023.
//

import Foundation
import SwiftUI

/*
//struct SegmentedView: View {
//    init() {
//    
//    }
//    @State private var selectedTab: Tabs = .login
//
//        enum Tabs: String, CaseIterable {
//            case login = "Log In"
//            case register = "Register"
//        }
//
//        var body: some View {
//            NavigationView {
//                
//                VStack {
//                   
//                    CustomSegmentedControl(selectedTab: $selectedTab)
//                        .background(currentBackgroundColor)
//                        .padding()
//
//                    tabView
//                }
//                .navigationBarHidden(true)
//                
//            }
//        }
//
//        var tabView: some View {
//            Group {
//                if selectedTab == .login {
//                    LogIn()
//                } else if selectedTab == .register {
//                    Register()
//                }
//            }
//        }
//
//        var currentBackgroundColor: Color {
//            switch selectedTab {
//            case .login:
//                return Color.accentColor
//            case .register:
//                return Color.accentColor
//            }
//        }
//    }
//
//    struct CustomSegmentedControl: View {
//        @Binding var selectedTab: SegmentedView.Tabs
//
//        var body: some View {
//            Picker("", selection: $selectedTab) {
//                ForEach(SegmentedView.Tabs.allCases, id: \.self) { tab in
//                    Text(tab.rawValue)
//                }
//            }
//            .pickerStyle(SegmentedPickerStyle())
//        }
 //    }
 
 // MARK: Data Service Sink with below maps
 //        dataService.$allCoins
 //            .sink { [weak self] (returnedCoins) in
 //                self?.allCoins = returnedCoins
 //            }
 //            .store(in: &cancellable)
 // MARK: Maps clousre
 //            .map { (text, startingCoins) -> [CoinModel] in
 //                guard !text.isEmpty else {
 //                    return startingCoins
 //                }
 //                let lowercasedText = text.lowercased()
 //
 //                return startingCoins.filter { coin in
 //                    return coin.name.lowercased().contains(lowercasedText) ||
 //                    coin.symbol.lowercased().contains(lowercasedText) ||
 //                    coin.id.lowercased().contains(lowercasedText)
 //                }
 //            }
 //             .tryMap { (output) -> Data in
 //                 guard let response = output.response as? HTTPURLResponse,
 //                       response.statusCode >= 200 && response.statusCode < 300 else {
 //                     throw URLError(.badServerResponse)
 //                       }
 //                 return output.data
 //             }
 // MARK: Navigation link
 //                        NavigationLink(destination: NotificationAlertView(coin: coin)) {
 //                            NotificationCoinsRowView(coin: coin)
 //                        }
 //            .onDisappear {
 //                        // Ensure that the onCoinSelected closure is called even if the user doesn't tap on a coin
 //                onCoinSelected(vm.allCoins.first!)
 //                    }
 //                .onTapGesture {
 //                    showNextView.toggle()
 //                }
 //            NavigationLink("", destination: NotificationCoinsView(), isActive: $showNextView)
 /            .navigationDestination(isPresented: $showCoinAlertView, destination: NotificationAlertView(coin: selectedCoin))
 */
 // MARK: UPDATE FUNCTION
 //private func updateSelectedCoin(coin: CoinModel) {
 //        selectedCoin = coin
 //
 //    if let portfolioCoins = vm.porfolioCoin.first(where: { $0.id == coin.id }),
 //       let amount = portfolioCoins.priceChangePercentage24H {
 //            AlertTypeText = "\(amount)"
 //        } else {
 //            AlertTypeText = ""
 //        }
 //    }



// MARK: Notification View

//struct NotificationView: View {
//    // ... other properties ...
//
//    var body: some View {
//        VStack {
//            HStack {
//                headerView
//                NavigationLink(destination: NotificationCoinsView()) {
//                    CircleButtonView(width: width, height: height)
//                        .padding(.trailing)
//                }
//            }
//            .padding(.bottom, 150)
//
//            List(notifications) { notification in
//                Text("Alert Type: \(notification.alertType), Price: \(notification.updatedPrice)")
//                    .foregroundColor(Color.white)
//                    .padding(.horizontal)
//            }
//            .listStyle(PlainListStyle())
//
//            if notifications.isEmpty {
//                imageView
//            }
//
//            Spacer()
//
//            NavigationLink(destination: NotificationCoinsView()) {
//                Text("Add Alert")
//                    .font(.headline)
//                    .foregroundColor(Color.white)
//                    .frame(height: 55)
//                    .frame(maxWidth: .infinity)
//                    .background(Color.theme.backgroundColor)
//                    .padding(.horizontal)
//                    .padding(.bottom)
//            }
//        }
//        .navigationTitle("")
//        .toolbar(.hidden)
//    }
//}
//
//MARK: Notification Alert2
//
//struct NotificationAlert2: View {
//    @Environment(\.presentationMode) var presentationMode
//    @State private var alertButtonText = "Add Alert"
//    @State private var updatedPrice: Double = 0.0
//    @State private var notifications: [NotificationModel] = []
//
//    // ... other properties ...
//
//    var body: some View {
//        // ... other code ...
//
//        NavigationLink {
//            AlertimageView()
//        } label: {
//            AlertButton(buttonText: $alertButtonText)
//        }
//        .onTapGesture {
//            // Create a new notification and add it to the array
//            let notification = NotificationModel(alertType: alertType, updatedPrice: updatedPrice)
//            notifications.append(notification)
//            presentationMode.wrappedValue.dismiss()
//        }
//    }
//}
// MARK: Notification Model

//struct NotificationModel: Identifiable {
//    let id = UUID()
//    let alertType: String
//    let updatedPrice: Double
//    // Add other properties as needed
//}


// MARK: code for getting information from the internet
//struct MainView: View {
//    @State private var isSelected: Int = 0
//    var body: some View {
//        ZStack {
//            VStack(spacing: 0) {
//                
//                if isSelected == 0 {
//                    HomeScreen()
//                } else if isSelected == 1 {
//                    NotificationView( )
//                }
//                coustomtTabbar(isSelected: $isSelected)
//                
//            }
//            .background(Color.accentColor)
//        }
//    }
//}
//struct NotificationView: View {
//
//    @State var buttonText: String = "Add Alert"
//    @State private var showNextView: Bool = false
//    let width: CGFloat = 35
//    let height: CGFloat = 30
//    var body: some View {
//        VStack {
//            HStack {
//                headerView
//                NavigationLink(destination: NotificationCoinsView()) {
//                    CircleButtonView(width: width, height: height)
//                        .padding(.trailing)
//                        .opacity(notificaations.isEmpty ? 0 : 1)
//                }
//            }
//            if .isEmpty {
//                imageView
//                    .padding(.top, 150)
//                Spacer()
//                NavigationLink(destination: NotificationCoinsView()) {
//                    Text("Add Alert")
//                        .font(.headline)
//                        .foregroundStyle(Color.white)
//                        .frame(height: 55)
//                        .frame(maxWidth: .infinity)
//                        .background(Color.theme.backgroundColor)
//                        .padding(.horizontal)
//                        .padding(.bottom)
//                }
//                
//            } else {
//                List {
//                    ForEach() {_ in
//                        NotificationRowView(notifications: )
//                    }
//                    .listRowSeparator(.visible)
//                    .listRowBackground(Color.accentColor)
//                }
//                .listStyle(PlainListStyle())
//            }
//        }
//        .navigationTitle("")
//        .toolbar(.hidden)
//    }
//}
//struct NotificationCoinsView: View {
//    @EnvironmentObject var vm: HomeViewModel
//    @Environment(\.presentationMode) var presentationMode
//    @State private var selectedCoin: CoinModel? = nil
//    @State private var showCoinAlertView: Bool = false
//    private let onNotificationCoinVeiw: Bool = true
//    private let searchBarHeight: CGFloat = 35
//    var body: some View {
//        ZStack {
//            color
//            VStack {
//                HStack {
//                    SearchBarView(searchText: $vm.searchText, searchBarHeight: searchBarHeight)
//                    Text("Cancel")
//                        .foregroundStyle(.white)
//                        .padding(.trailing)
//                        .onTapGesture {
//                            presentationMode.wrappedValue.dismiss()
//                    }
//                }
//                listView
//                Spacer()
//            }
//        }
//        .background(
//            NavigationLink("", destination: NotificationAlertView(coin: selectedCoin), isActive: $showCoinAlertView)
//                .opacity(0)
//                
//        )
//        .navigationTitle("")
//        .navigationBarHidden(true)
//    }
//}
//struct NotificationAlertView: View {
//    @EnvironmentObject var vm: HomeViewModel
//    @Environment(\.dismiss) var dismiss
//    @State private var selectedCoin: CoinModel? = nil
//     private let onNotificationCoinVeiw: Bool = false
//    @State private var textFieldText: String = ""
//    @State private var alertButton: String = "Create Alert"
//    @State private var selectedAlertType: String = "Select alert"
//    @State private var selectedFrequency: DropDownMenuOption? = nil
//  
//    let coin: CoinModel?
//    var body: some View {
//        ZStack {
//            Color.accentColor.ignoresSafeArea()
//            VStack(alignment: .leading, spacing: 20) {
//                header
//                .padding(.bottom, 25)
//                NotificationCoinsRowView(coin: coin!, onNotificationCoinView: onNotificationCoinVeiw)
//                    textFields
//                Spacer()
//                NavigationLink {
//                    NotificationAlert2( alertType: selectedAlertType, frequency: selectedFrequency ?? DropDownMenuOption.selectOneOption, textFieldText: textFieldText, coin: coin!,
//                } label: {
//                    AlertButton(buttonText: $alertButton)
//                }
//            }
//        }
//        .navigationTitle("")
//        .navigationBarHidden(true)
//    }
//}
//struct NotificationAlert2: View {
//    
//    @Environment(\.presentationMode) var presentationMode
//    @State private var alertButtonText = "Add Alert"
//    @State private var updatedPrice: Double = 0.0
//    
//        let alertType: String
//        let frequency: DropDownMenuOption
//        let textFieldText: String
//        let coin: CoinModel
//    
//    var body: some View {
//        ZStack {
//            Color.accentColor.ignoresSafeArea()
//            VStack(alignment: .leading, spacing: 20) {
//                header
//                    .padding(.bottom, 30)
//                coinView
//                Divider()
//                VStack(alignment: .leading, spacing: 4) {
//                    SecondRowView
//                    Text(frequency.option)
//                        .font(.headline)
//                        .foregroundStyle(.white)
//                        .padding(8)
//                        .background(
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(Color.theme.backgroundColor)
//                        )
//                        .padding(.leading)
//                }
//                Spacer()
//                NavigationLink {
//                    MainView()
//                } label: {
//                    AlertButton(buttonText: $alertButtonText)
//                }
//            }
//        }
//        .onAppear {
//            if let price = Double(textFieldText) {
//                updatedPrice = (coin.currentPrice ) + price
//            } else {
//                updatedPrice = (coin.currentPrice)
//            }
//        }
////        .navigationTitle("")
//        .toolbar(.hidden)
//        
//    }
//}





// MARK: Chart adjustment for the rows
//private func normalizeData(chartHeight: CGFloat) -> [CGFloat] {
//    let maxValue = data.max() ?? 1
//    let minValue = data.min() ?? 0
//    let range = maxValue - minValue
//    let scaledData = data.map { value in
//        (value - minValue) / range * chartHeight
//    }
//
//    // Adjust the scaling factor here to match the original chart's proportions
//    let adjustedScaledData = scaledData.map { value in
//        value * 0.8 // Adjust this value to fine-tune the scaling
//    }
//
//    return adjustedScaledData
//}


// MARK: NotificationAlert2 button for saving the data
//                Button {
//                    let notification = NotifiacationModel(alertType: alertType, updatedPrice: updatedPrice, coin: coin)
//                    print("Before append: \(notificationData.notifications)")
//                    notificationData.notifications.append(notification)
//                    print("After append: \(notificationData.notifications)")
////                   updateNotifications()
//                } label: {
//                    Image(systemName: "checkmark")
//
//                        .foregroundColor(.gray)
//                }


//                    let notification = NotifiacationModel(alertType: alertType, updatedPrice: updatedPrice, coin: coin)
//                    notificationData.notifications.append(notification)
//                    print("Before append: \(notificationData.notifications)")
                    
//                    notificationData.notifications.append(notification)
//                    print("After append: \(notificationData.notifications)")

//                .onDisappear {
//                    let notificationData = NotifiacationModel(alertType: alertType, updatedPrice: updatedPrice, coin: coin)
//                    updateNotifications()
//
//                    // Pass notificationData to NotificationView
//                }

//            print("After append: \(notificationData.notifications)")
//            let notification = NotifiacationModel(alertType: alertType, updatedPrice: updatedPrice, coin: coin)
//            updateNotifications()

//struct NotificationDataModel {
//    let coin: CoinModel
//    let updatedPrice: Double
//}
