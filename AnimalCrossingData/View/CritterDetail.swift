//
//  CritterDetail.swift
//  AnimalCrossingData
//
//  Created by Hongliang Fan on 2020-07-04.

import SwiftUI

struct CritterDetail: View {
    @EnvironmentObject var userData: UserData
    var critter: CritterInfo
    var body: some View {
        VStack {
            critter.fullImage
                .resizable().scaledToFit().padding()
            HStack {
                Spacer()
                ButtonView(userId: "1", fileName: critter.fileName)
                Text(critter.name.nameUSen)
                ButtonView(userId: "2", fileName: critter.fileName)
                Spacer()
            }
            Text("Price: \(critter.price)")
            Text("Month: \(critter.availability.isAllYear ? "All Year" : critter.availability.monthNorthern)")
            Text("Hours: \(critter.availability.isAllDay ? "All Day" : critter.availability.time)")
            if let seaCreature = critter as? SeaCreatureInfo {
                SeaCreatureSpecificDetail(seaCreature: seaCreature)
            }
            if let bug = critter as? BugInfo {
                BugSpecificDetail(bug: bug)
            }
            if let fish = critter as? FishInfo {
                FishSpecificDetail(fish: fish)
            }
        }
    }
}

struct SeaCreatureSpecificDetail: View {
    var seaCreature: SeaCreatureInfo
    var body: some View {
        VStack {
            Text("Speed: \(seaCreature.speed.rawValue)")
            Text("Shadow: \(seaCreature.shadow.rawValue)")
        }
    }
}
struct BugSpecificDetail: View {
    var bug: BugInfo
    var body: some View {
        VStack {
            Text("Location: \(bug.availability.location!)")
            Text("Rarity: \(bug.availability.rarity!.rawValue)")
        }
    }
}
struct FishSpecificDetail: View {
    var fish: FishInfo
    var body: some View {
        VStack {
            Text("Location: \(fish.availability.location!)")
            Text("Rarity: \(fish.availability.rarity!.rawValue)")
            Text("Shadow: \(fish.shadow)")
        }
    }
}

//struct SeaCreatureDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        let userData = UserData()
//        return SeaCreatureDetail(seaCreature: userData.seaCreatures[0])}
//}
