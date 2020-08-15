//
//  UserData.swift
//  AnimalCrossingData
//
/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A model object that stores app data.
*/

import Combine
import SwiftUI

class CommonData {
    var seaCreatures: [SeaCreatureInfo]
    var arts: [ArtInfo]
    var bugs: [BugInfo]
    var fish: [FishInfo]
    static let sharedInstance = CommonData()
    init() {
        self.seaCreatures = Array(seaCreatureData.values)
        self.seaCreatures.sort {
            $0.price > $1.price
        }
        self.arts = Array(artData.values)
        self.arts.sort {
            $0.name.nameUSen < $1.name.nameEUen
        }
        self.bugs = Array(bugData.values)
        self.bugs.sort {
            $0.price > $1.price
        }
        self.fish = Array(fishData.values)
        self.fish.sort {
            $0.price > $1.price
        }
    }
}
func defaultUserData() -> [String: Bool] {
    var allFalseDict : [String: Bool] = [:]
    CommonData.sharedInstance.seaCreatures.forEach {
        allFalseDict[$0.fileName] = false
    }
    CommonData.sharedInstance.arts.forEach {
        allFalseDict[$0.fileName] = false
    }
    CommonData.sharedInstance.fish.forEach {
        allFalseDict[$0.fileName] = false
    }
    CommonData.sharedInstance.bugs.forEach {
        allFalseDict[$0.fileName] = false
    }
    return allFalseDict
}

func defaultUsersData(numOfUsers: Int)->[String: [String: Bool]] {
    var allUsersData:[String: [String: Bool]] = [:]
    for userId in 1...numOfUsers
    {
        allUsersData["\(userId)"] = defaultUserData()
    }
    return allUsersData
}
final class UserData: ObservableObject {
    @Published var usersDict: [String: [String: Bool]] {
        didSet {
            UserDefaults.standard.set(usersDict, forKey: "usersDict")
        }
    }
    init() {
        self.usersDict = UserDefaults.standard.object(forKey: "usersDict") as? [String: [String: Bool]] ?? defaultUsersData(numOfUsers: 2)
    }
}
