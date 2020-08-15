//
//  Bug.swift
//  AnimalCrossingData
//
//  Created by Hongliang Fan on 2020-07-11.
//  Copyright © 2020 Hongliang Fan. All rights reserved.
//

import Foundation
import SwiftUI

typealias BugDict = [String: BugInfo]
class BugInfo: CritterInfo {
    let priceFlick: Int
    let catchPhrase, museumPhrase: String
    let altCatchPhrase: [String]?

    enum CodingKeys: String, CodingKey {
        case priceFlick = "price-flick"
        case catchPhrase = "catch-phrase"
        case museumPhrase = "museum-phrase"
        case altCatchPhrase = "alt-catch-phrase"
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.priceFlick = try container.decode(Int.self, forKey: .priceFlick)
        self.catchPhrase = try container.decode(String.self, forKey: .catchPhrase)
        self.museumPhrase = try container.decode(String.self, forKey: .museumPhrase)
        self.altCatchPhrase = try? container.decode([String].self, forKey: .altCatchPhrase)
        try super.init(from: decoder)
    }
    override func typeName()->String {
        return "bugs"
    }
}





//// MARK: - Name
//struct Name: Codable {
//    let nameUSen, nameEUen, nameEUde, nameEUes: String
//    let nameUSes, nameEUfr, nameUSfr, nameEUit: String
//    let nameEUnl, nameCNzh, nameTWzh, nameJPja: String
//    let nameKRko, nameEUru: String
//
//    enum CodingKeys: String, CodingKey {
//        case nameUSen = "name-USen"
//        case nameEUen = "name-EUen"
//        case nameEUde = "name-EUde"
//        case nameEUes = "name-EUes"
//        case nameUSes = "name-USes"
//        case nameEUfr = "name-EUfr"
//        case nameUSfr = "name-USfr"
//        case nameEUit = "name-EUit"
//        case nameEUnl = "name-EUnl"
//        case nameCNzh = "name-CNzh"
//        case nameTWzh = "name-TWzh"
//        case nameJPja = "name-JPja"
//        case nameKRko = "name-KRko"
//        case nameEUru = "name-EUru"
//    }
//}


