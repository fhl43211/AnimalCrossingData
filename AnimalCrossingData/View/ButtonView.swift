//
//  ButtonView.swift
//  AnimalCrossingData
//
//  Created by Hongliang Fan on 2020-07-25.

import SwiftUI

struct ButtonView: View {
    @EnvironmentObject var userData: UserData
    let userId :String
    let fileName :String
    var body: some View {
        Button(action: {
            self.userData.usersDict[userId]![fileName]!.toggle()
        }) {
            if userData.usersDict[userId]![fileName]! {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color.green)
            } else {
                Image(systemName: "checkmark.seal")
                    .foregroundColor(Color.gray)
            }
        }.buttonStyle(BorderlessButtonStyle())
    }
}
