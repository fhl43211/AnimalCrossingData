//
//  CritterRow.swift
//  AnimalCrossingData
//
//  Created by Hongliang Fan on 2020-07-04.

import Foundation
import SwiftUI

struct CritterRow: View {
    @EnvironmentObject var userData: UserData
    var critter: CritterInfo
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                ButtonView(userId: "1", fileName: critter.fileName)
                Spacer()
                critter.iconImage
                Text(critter.name.nameUSen)
                Spacer()
                ButtonView(userId: "2", fileName: critter.fileName)
                Spacer()
            }
            Text("Price: \(critter.price)")
            Text("Hours: \(critter.availability.isAllDay ? "All Day" : critter.availability.time)")
            Text("Month: \(critter.availability.isAllYear ? "All Year" : critter.availability.monthNorthern)")
            if critter.nextMonthGone(currentTime: Date()) {
                Label("Not available next month", systemImage: "exclamationmark.triangle.fill").foregroundColor(.red)
            }
            Spacer()
        }
    }
}

//struct SeaCreatureRow_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            SeaCreatureRow(seaCreature: seaCreatureData[0])
//            SeaCreatureRow(seaCreature: seaCreatureData[1])
//        }
//        .previewLayout(.fixed(width: 300, height: 70))
//    }
//}
