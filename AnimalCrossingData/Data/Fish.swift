//
//  Fish.swift
//  AnimalCrossingData
//
//  Created by Hongliang Fan on 2020-07-11.
//  Copyright © 2020 Hongliang Fan. All rights reserved.
//

import Foundation
import SwiftUI

typealias FishDict = [String: FishInfo]
class FishInfo: CritterInfo {
    let shadow: String
    let priceCj: Int
    let catchPhrase, museumPhrase: String
    let altCatchPhrase: [String]?

    enum CodingKeys: String, CodingKey {
        case shadow
        case priceCj = "price-cj"
        case catchPhrase = "catch-phrase"
        case museumPhrase = "museum-phrase"
        case altCatchPhrase = "alt-catch-phrase"
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.shadow = try container.decode(String.self, forKey: .shadow)
        self.priceCj = try container.decode(Int.self, forKey: .priceCj)
        self.catchPhrase = try container.decode(String.self, forKey: .catchPhrase)
        self.museumPhrase = try container.decode(String.self, forKey: .museumPhrase)
        self.altCatchPhrase = try? container.decode([String].self, forKey: .altCatchPhrase)
        try super.init(from: decoder)
    }
    override func typeName()->String {
        return "fish"
    }
}


