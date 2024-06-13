//
//  CropListView.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 7/6/22.
//

import SwiftUI

struct CropListView: View {
    @EnvironmentObject private var cropVM: CropViewModel

    var body: some View {
        var sortedCrops = cropVM.crops.sorted{cropVM.gameObjects[$0.key]?.displayName ?? "" < cropVM.gameObjects[$1.key]?.displayName ?? ""}

        List {
            ForEach(sortedCrops.indices){ index in
                NavigationLink {
                    CropDetailView(cropKey: sortedCrops[index].key)
                } label: {
                    Text(
                       LocalizedStringKey(getIdFromString(string: cropVM.gameObjects[sortedCrops[index].key]?.displayName ?? "Error")),
                       tableName: "ObjectStrings"
                   )
                }
            }
        }
        .navigationTitle("Crops")
    }
}

struct CropListView_Previews: PreviewProvider {
    static var previews: some View {
        CropListView()
    }
}
