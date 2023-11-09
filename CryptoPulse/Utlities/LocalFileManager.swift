//
//  LocalFileManager.swift
//  CryptoPulse
//
//  Created by SAIF ALI KHAN on 17/11/2023.
//

import Foundation
import SwiftUI

class LocalFileManager {
    static let instance = LocalFileManager()
    private init() { }
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        // create folder
        createFolderIfNeeded(folderName: folderName)
        // get path for images
       guard
        let data = image.pngData(),
        let url = getUrlForImages(ImageName: imageName, FolderName: folderName) else { return }
        // save images
        do {
            try data.write(to: url)
        } catch (let error) {
            print("error saving images: \(imageName)  \(error)")
        }
    }
    
     func getImage(imageName: String, folderName: String) -> UIImage? {
        guard
            let url = getUrlForImages(ImageName: imageName, FolderName: folderName),
            FileManager.default.fileExists(atPath: url.path) else {
            return nil
        }
        return UIImage(contentsOfFile: url.path)
    }
    
    private func createFolderIfNeeded(folderName: String) {
        guard let url = getUrlFolder(folderName: folderName) else { return }
        
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print("error creating directory: \(folderName). \(error)")
            }
        }
    }
    
    private func getUrlFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        return url.appendingPathComponent(folderName)
    }
    
    private func getUrlForImages(ImageName: String, FolderName: String) -> URL? {
        guard let folderUrl = getUrlFolder(folderName: FolderName) else {
            return nil
        }
        return folderUrl.appendingPathComponent(ImageName + ".png")
    }
}

