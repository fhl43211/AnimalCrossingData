//
//  CreaturesList.swift
//  AnimalCrossingData
//
//  Created by Hongliang Fan on 2020-07-04.
//  Copyright © 2020 Hongliang Fan. All rights reserved.
//

import SwiftUI
enum Sort : String, CaseIterable{
    case id, priceHighToLow, priceLowToHigh, nameAtoZ
    
    func sort( collection: [CritterInfo] )->[CritterInfo]{
        var collectionCopy = collection
        switch self {
        case .id:
            collectionCopy.sort{
                $0.id < $1.id
            }
            return collectionCopy
        case .nameAtoZ:
            collectionCopy.sort{
                $0.name.nameUSen < $1.name.nameUSen
            }
            return collectionCopy
        case .priceHighToLow:
            collectionCopy.sort{
                $0.price > $1.price
            }
            return collectionCopy
        case .priceLowToHigh:
            collectionCopy.sort{
                $0.price < $1.price
            }
            return collectionCopy
        }
    }
}
struct CrittersList: View {
    @EnvironmentObject var userData: UserData
    var critters: [CritterInfo]
    var type: String
    @State private var showThisMonthOnly = false
    @State private var showThisTimeOnly = false
    @State private var showLeftUnCheckedOnly = false
    @State private var showRightUnCheckedOnly = false
    @State private var sortMethod = Sort.priceHighToLow
    func filterCritters()->[CritterInfo] {
        let sortedCritters = sortMethod.sort(collection: self.critters)
        return sortedCritters
          .filter{!self.showThisMonthOnly || $0.isAvailableThisMonth(currentTime: Date())}
          .filter{!self.showThisTimeOnly || $0.isAvailableThisHour(currentTime: Date())}
          .filter{!self.showLeftUnCheckedOnly || !self.userData.usersDict["1"]![$0.fileName]!}
          .filter{!self.showRightUnCheckedOnly || !self.userData.usersDict["2"]![$0.fileName]!}
    }
    func countCollectedCritters(userId: String)->Int {
        return self.critters.filter{self.userData.usersDict[userId]![$0.fileName]!}.count
    }
    private var picker : some View{
        Picker(selection: $sortMethod, label: Text("")) {
            ForEach(Sort.allCases, id: \.self) { sort in
                Text(sort.rawValue)
            }
        }.pickerStyle(SegmentedPickerStyle())
    }
    var body: some View {
        NavigationView {
            List {
                Section(header: picker) {}
                
                HStack{
                    Toggle(isOn: $showThisMonthOnly) {
                        Text("Show This Month Only")
                    }
                    Toggle(isOn: $showThisTimeOnly) {
                        Text("Show This Hour Only")
                    }
                }
                HStack  {
                    Toggle(isOn: $showLeftUnCheckedOnly) {
                       Text("Filter LHS (\(countCollectedCritters(userId: "1"))/\(self.critters.count))")
                    }
                    Toggle(isOn: $showRightUnCheckedOnly) {
                        Text("Filter RHS (\(countCollectedCritters(userId: "2"))/\(self.critters.count))")
                    }
                }
                ForEach(filterCritters()) { critterObj in
                    NavigationLink(destination: CritterDetail(critter: critterObj))
                    {
                        CritterRow(critter: critterObj)
                    }
                }
            }
            .navigationBarTitle(type)
        }
        
    }
}

//struct SeaCreaturesList_Previews: PreviewProvider {
//    static var previews: some View {
//        ForEach(["iPhone 11"], id: \.self) { deviceName in
//            SeaCreaturesList(userData: UserData())
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
//    }
//}
