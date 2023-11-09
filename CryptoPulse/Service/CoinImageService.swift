//
//  CoinImageService.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 17/11/2023.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    @Published var image: UIImage? = nil
     private var imageSubcription: AnyCancellable?
     private let coin: CoinModel
     private let fileManager = LocalFileManager.instance
     private let folderName = "coin_images"
     private let imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImages()
    }
    
    private func getCoinImages() {
        if let savedImages = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImages
            print("retrive images from the file Manager")
        } else {
            downloadedCoinImage()
            print("Downloading images now")
        }
    }
    
    private func downloadedCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubcription = NetworkManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedImages) in
                guard let self = self, let downloadedImage = returnedImages else { return }
                self.image = downloadedImage
                self.imageSubcription?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
        })
    }
}
