//
//  SeaCreature.swift
//  AnimalCrossingData

import Foundation

typealias SeaCreatureDict = [String: SeaCreatureInfo]


class SeaCreatureInfo : CritterInfo {
 
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.speed = try container.decode(Speed.self, forKey: .speed)
        self.shadow = try container.decode(Shadow.self, forKey: .shadow)
        try super.init(from: decoder)
    }
    let speed: Speed
    let shadow: Shadow
    enum CodingKeys: String, CodingKey {
        case speed
        case shadow
    }
    override func typeName()->String {
        return "sea"
    }
}

