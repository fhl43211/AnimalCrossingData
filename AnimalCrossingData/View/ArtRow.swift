//
//  ArtRow.swift
//  AnimalCrossingData
//
//  Created by Hongliang Fan on 2020-07-05.
//  Copyright © 2020 Hongliang Fan. All rights reserved.
//

import SwiftUI

struct ArtRow: View {
    var art: ArtInfo
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                art.fullImage
                Text(art.name.nameUSen)
                Spacer()
            }
            Text("Price: \(art.buyPrice)")
            if (art.hasFake) {
                Label("Has fake", systemImage: "exclamationmark.triangle.fill").foregroundColor(.red)
            }
            Spacer()
        }
    }
}
//
//struct ArtRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ArtRow()
//    }
//}
