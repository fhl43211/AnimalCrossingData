//
//  TabView.swift
//  AnimalCrossingData
//
//  Created by Hongliang Fan on 2020-07-05.

import SwiftUI

struct ACNHTabView: View {
    @EnvironmentObject var userData: UserData
    var body: some View {
        TabView {
            CrittersList(critters: CommonData.sharedInstance.seaCreatures, type: "Sea").tabItem {
                Image(systemName: "capsule.fill")
                Text("Sea")
            }
            CrittersList(critters: CommonData.sharedInstance.fish, type: "Fish").tabItem {
                Image(systemName: "drop.fill")
                Text("Fish")
            }
            CrittersList(critters: CommonData.sharedInstance.bugs, type: "Bug").tabItem {
                Image(systemName: "ladybug.fill")
                Text("Bug")
            }
            ArtsList().tabItem {
                Image(systemName: "paintpalette.fill")
                Text("Art")
            }
        }
    }
}

//struct TabView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabView()
//    }
//}
