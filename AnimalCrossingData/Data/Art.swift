//
//  Art.swift
//  AnimalCrossingData

import Foundation
import SwiftUI

typealias ArtDict = [String: ArtInfo]
// MARK: - ArtInfo
struct ArtInfo: Codable, Identifiable {
    
    let id: Int
    let fileName: String
    let name: Name
    let hasFake: Bool
    let buyPrice, sellPrice: Int
    var fullImage: Image {
        ImageStore.shared.image(name: fileName, subFolderPath: "images/art")
    }

    enum CodingKeys: String, CodingKey {
        case id
        case fileName = "file-name"
        case name, hasFake
        case buyPrice = "buy-price"
        case sellPrice = "sell-price"
    }
}

