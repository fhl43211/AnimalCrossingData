//
//  JSONFormatHelper.swift
//  AnimalCrossingData
//
//  Created by Hongliang Fan on 2020-07-11.
//  Copyright © 2020 Hongliang Fan. All rights reserved.
//

import Foundation
import SwiftUI

enum Rarity: String, Codable {
    case common = "Common"
    case rare = "Rare"
    case ultraRare = "Ultra-rare"
    case uncommon = "Uncommon"
}

class CritterInfo: Codable, Identifiable {
    let id: Int
    let fileName: String
    let name: Name
    let availability: Availability
    let price: Int
    let museumDesc: String

    enum CodingKeys: String, CodingKey {
        case id
        case fileName = "file-name"
        case name, availability, price
        case museumDesc = "museum-phrase"
    }
    
    func nextMonthGone(currentTime: Date)->Bool {
        if availability.isAllYear {
            return false
        }
        else {
            let oneMonthLaterDate = Calendar.current.date(byAdding: .month, value: +1, to: currentTime)
            let availableThisMonth = isAvailableThisMonth(currentTime: currentTime)
            let availableNextMonth = isAvailableThisMonth(currentTime: oneMonthLaterDate!)
            return availableThisMonth && !availableNextMonth
        }
    }
    func isAvailableThisHour(currentTime: Date)->Bool {
        let currentHour = Calendar.current.component(.hour, from: currentTime)
        if availability.isAllDay {
            return true
        }
        else {
            return availability.timeArray.contains(currentHour)
        }
    }
    func isAvailableThisMonth(currentTime: Date)->Bool {
        let currentMonth = Calendar.current.component(.month, from: currentTime)
        if availability.isAllYear {
            return true
        }
        else {
            return availability.monthArrayNorthern.contains(currentMonth)
        }
    }

    init(id: Int, fileName: String, name: Name, availability: Availability, price: Int, museumDesc: String) {
        self.id = id
        self.fileName = fileName
        self.name = name
        self.availability = availability
        self.price = price
        self.museumDesc = museumDesc
    }
    func typeName()->String {
        return ""
    }
    var iconImage: Image {
        ImageStore.shared.iconImage(name: fileName, subFolderPath: "icons/\(typeName())")
    }
    var fullImage: Image {
        ImageStore.shared.image(name: fileName, subFolderPath: "images/\(typeName())")
    }
}

struct Name: Codable {
    let nameUSen, nameEUen, nameEUde, nameEUnl: String
    let nameEUes, nameUSes, nameEUfr, nameUSfr: String
    let nameEUit, nameCNzh, nameTWzh, nameJPja: String
    let nameKRko, nameEUru: String

    enum CodingKeys: String, CodingKey {
        case nameUSen = "name-USen"
        case nameEUen = "name-EUen"
        case nameEUde = "name-EUde"
        case nameEUnl = "name-EUnl"
        case nameEUes = "name-EUes"
        case nameUSes = "name-USes"
        case nameEUfr = "name-EUfr"
        case nameUSfr = "name-USfr"
        case nameEUit = "name-EUit"
        case nameCNzh = "name-CNzh"
        case nameTWzh = "name-TWzh"
        case nameJPja = "name-JPja"
        case nameKRko = "name-KRko"
        case nameEUru = "name-EUru"
    }
}

enum Shadow: String, Codable {
    case large = "Large"
    case largest = "Largest"
    case medium = "Medium"
    case small = "Small"
    case smallest = "Smallest"
}

enum Speed: String, Codable {
    case fast = "Fast"
    case medium = "Medium"
    case slow = "Slow"
    case stationary = "Stationary"
    case veryFast = "Very fast"
    case verySlow = "Very slow"
    case null = "Null"
}

// MARK: - Availability
struct Availability: Codable {
    let monthNorthern, monthSouthern, time: String
    let isAllDay, isAllYear: Bool
    let location: String?
    let rarity: Rarity?
    let monthArrayNorthern, monthArraySouthern, timeArray: [Int]

    enum CodingKeys: String, CodingKey {
        case monthNorthern = "month-northern"
        case monthSouthern = "month-southern"
        case time, isAllDay, isAllYear, location, rarity
        case monthArrayNorthern = "month-array-northern"
        case monthArraySouthern = "month-array-southern"
        case timeArray = "time-array"
    }
}
