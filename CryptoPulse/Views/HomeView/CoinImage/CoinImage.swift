//
//  CoinImage.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 17/11/2023.
//

import SwiftUI



struct CoinImage: View {
    @StateObject var vm: CoinImageViewModel
    init(coin: CoinModel) {
       _vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()                    
            } else if vm.isLoading {
                 ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundStyle(Color.theme.walkthrough)
            }
        }
    }
}

struct CoinImageView_previews: PreviewProvider {
    static var previews: some View {
        CoinImage(coin: dev.coin)
            
    }
}

