//
//  FarmAnimalListView.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 12/12/23.
//

import SwiftUI

struct FarmAnimalListView: View {
    @EnvironmentObject private var farmAnimalVM: FarmAnimalViewModel

    var body: some View {
        var sortedAnimals = farmAnimalVM.farmAnimals.sorted{$0.key < $1.key}
        List {
            ForEach(sortedAnimals.indices){ index in
                NavigationLink {
                    FarmAnimalDetailView(farmAnimalKey: sortedAnimals[index].key)
                } label: { Text(sortedAnimals[index].key) }
            }
        }
        .navigationTitle("Farm Animals")
    }
}

struct FarmAnimalListView_Previews: PreviewProvider {
    static var previews: some View {
        FarmAnimalListView()
    }
}
