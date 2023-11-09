//
//  CoinsView.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 16/11/2023.
//

import SwiftUI
import SwiftData

struct CoinsView: View {
    @EnvironmentObject var vm: HomeViewModel
    @Environment(\.presentationMode) var presentationMode
//    @State private var selectedCoins: CoinModel? = nil
    @State private var isNotOnHome: Bool = false
    let searchBarHeight: CGFloat = 55
    var onCoinSelected: (CoinModel) -> Void
    let amount: Double = 0
    var body: some View {
        ZStack {
            color
            VStack {
                HStack(alignment: .center) {
                    header                       
                }
                .padding(.top)
                SearchBarView(searchText: $vm.searchText, searchBarHeight: searchBarHeight)
                    .padding(.top, 20)
                listView
                .padding(.bottom, 15)
                Spacer()
            }

        }
        .navigationTitle("")
        .toolbar(.hidden)
    }
}

extension CoinsView {
    private var color: some View {        
        RadialGradient(gradient: Gradient(colors: [Color("BackgroundColor").opacity(0.8),  Color.accentColor]), center: .bottomTrailing, startRadius: 2, endRadius: 100).ignoresSafeArea()
    }
    
    private var header: some View {
        HStack(alignment: .center) {
            Image(systemName: "arrow.backward")
                .bold()
                .foregroundStyle(Color.theme.walkthrough)
                .padding(.leading)
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
            Spacer()
            Text("Add Crypto to monitor")
                .bold()
                .foregroundStyle(Color.white)
            Spacer()
            
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
            .padding(.trailing)
        }
        
    }
    
    private var listView: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, isOnHomeView: $isNotOnHome)
                    .onTapGesture {
//                   guard let coin = selectedCoins else { return }
//                                vm.updatePortfolio(coin: coin, amount: amount)
                        onCoinSelected(coin)
//                        vm.porfolioCoin = []
                        presentationMode.wrappedValue.dismiss()
                        vm.searchText = ""                        
                    }
            }
            .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 4))
            .listRowSeparator(.visible)
            .listRowBackground(Color.accentColor)
        }
        .listStyle(PlainListStyle())
    }
}

struct CoinsView_previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CoinsView( onCoinSelected: { _ in })
                .environmentObject(dev.homeVM)
        }
    }
}
