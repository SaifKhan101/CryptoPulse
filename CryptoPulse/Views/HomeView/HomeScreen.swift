//
//  HomeScreen.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 15/11/2023.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var vm: HomeViewModel
    @ObservedObject var viewModel = AlertViewModel()
    @State private var isSelected = 0
    @State private var isOnHomeView: Bool = true
    @State private var isPresented: Bool =  false
    @State private var selectedCoins: [CoinModel] = []
    let amount: Double = 0
    let width: CGFloat = 50
    let height: CGFloat = 50
    var body: some View {
        ZStack {
            Color.accentColor
                .ignoresSafeArea()
            
            VStack {
                header
                listView
                Spacer(minLength: 0)
            }
        }
        .background(
            NavigationLink(
                destination:  CoinsView(onCoinSelected: { selectedCoin in
                    saveSelectedCoin(selectedCoin: selectedCoin)
                 }),
                isActive: $isPresented,
                label: {
                    EmptyView()
                })
        )
        .navigationTitle("")
        .toolbar(.hidden)
    }
}

struct HomeScreenView_previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeScreen()
                .environmentObject(dev.homeVM)
        }
    }
}

extension HomeScreen {
    private var header: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                CircleButtonView(width: width, height: height)
                    .onTapGesture {
                        isPresented.toggle()
                    }
            }
            .padding(.horizontal)
            HStack {
                Text("Crypto Monitoring")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.theme.secondaryText)
                    .padding(.horizontal)
                
                Button {
                    withAnimation(.linear(duration: 2.0)) {
                        vm.reloadData()
                    }
                } label: {
                    Image(systemName: "goforward")
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.theme.secondaryText)
                }
                .rotationEffect(Angle(degrees: vm.isLoading ? 360 : 0), anchor: .center)
            }
        }
    }
    
    private var listView: some View {
        List {
            ForEach(vm.porfolioCoin) { coin in
                HomeViewCoinRow(coin: coin)
            }
            .listRowSeparator(.visible)
            .listRowSeparatorTint(.gray.opacity(0.5))
            .listRowBackground(Color.accentColor)
            
        }
        .listStyle(.plain)
    }
    
    private func saveSelectedCoin(selectedCoin: CoinModel) {
        vm.updatePortfolio(coin: selectedCoin, amount: amount)
        isPresented = false
        if !vm.porfolioCoin.contains(where: { $0.id == selectedCoin.id }) {
            vm.porfolioCoin.append(selectedCoin)
        }
    }
}
