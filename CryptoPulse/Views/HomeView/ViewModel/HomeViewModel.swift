//
//  HomeViewModel.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 16/11/2023.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var searchText = ""
    @Published var porfolioCoin: [CoinModel] = []
    @Published var isLoading: Bool = false
    
    private let dataService = CoinDataService()
    private var cancellable = Set<AnyCancellable>() 
    private let portfolioDataService = PortfolioDataService()
    
    init() {
       addSubcribers()
    }
    
    func addSubcribers() {
        
        // update all coins
        $searchText
            .combineLatest(dataService.$allCoins)
            .map(filteredCoins)

            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellable)
        
        // update main view
        $allCoins
            .combineLatest(portfolioDataService.$savedEntities)
            .map(mapAllCoinsToPortfolioCoins)
            .sink { [weak self] (returnedCoins) in
                self?.porfolioCoin = returnedCoins
                self?.isLoading = false
            }
            .store(in: &cancellable)
    }
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        print("Updating portfolio for coin: \(coin.name), amount: \(amount)")
        if let index = allCoins.firstIndex(where: { $0.id == coin.id }) {
                   allCoins[index] = coin.updateHoldings(amount: amount)
               }
        portfolioDataService.updatePortfolio(coin: coin, amount: amount)
    }
    
    func reloadData() {
        isLoading = true
        dataService.getCoins()
    }
    
    private func filteredCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }
        let lowercasedText = text.lowercased()
        
        return coins.filter { coin in
            return coin.name.lowercased().contains(lowercasedText) ||
            coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.lowercased().contains(lowercasedText)
        }
        
    }
    
    private func mapAllCoinsToPortfolioCoins(allCoins: [CoinModel], portfolioEntities: [PortfolioEntity]) -> [CoinModel] {
           allCoins
               .compactMap { (coin) -> CoinModel? in
                   guard let entity = portfolioEntities.first(where: { $0.coinID == coin.id }) else {
                       return nil
                   }
                   return coin.updateHoldings(amount: entity.amount)
               }
       }
}
