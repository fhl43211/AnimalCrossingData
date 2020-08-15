//
//  ArtsList.swift
//  AnimalCrossingData
//
//  Created by Hongliang Fan on 2020-07-05.

import SwiftUI

struct ArtsList: View {
    @EnvironmentObject var userData: UserData
    @State private var showNonDonatedOnly = false
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showNonDonatedOnly) {
                    Text("Show Non-Donated Only")
                }
                ForEach(CommonData.sharedInstance.arts) { artObj in
                    if !self.showNonDonatedOnly || !self.userData.usersDict["1"]![artObj.fileName]! || !self.userData.usersDict["2"]![artObj.fileName]! {
                        HStack {
                            Button(action: {
                                self.userData.usersDict["1"]![artObj.fileName]!.toggle()
                            }) {
                                if userData.usersDict["1"]![artObj.fileName]! {
                                    Image(systemName: "checkmark.seal.fill")
                                        .foregroundColor(Color.green)
                                } else {
                                    Image(systemName: "checkmark.seal")
                                        .foregroundColor(Color.gray)
                                }
                            }
                            Spacer()
                            ArtRow(art: artObj)
                            Button(action: {
                                self.userData.usersDict["2"]![artObj.fileName]!.toggle()
                            }) {
                                if userData.usersDict["2"]![artObj.fileName]! {
                                    Image(systemName: "checkmark.seal.fill")
                                        .foregroundColor(Color.green)
                                } else {
                                    Image(systemName: "checkmark.seal")
                                        .foregroundColor(Color.gray)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Arts"))
        }
        
    }
}

//struct ArtsList_Previews: PreviewProvider {
//    static var previews: some View {
//        ArtsList()
//    }
//}

