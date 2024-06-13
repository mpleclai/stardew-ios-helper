//
//  VillagerListView.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 7/6/22.
//

import SwiftUI

struct VillagerListView: View {
    @EnvironmentObject private var villagerVM: VillagerViewModel

    var body: some View {
        var sortedVillagers = villagerVM.villagers.sorted{$0.key < $1.key}

        VStack {
            Text("Villagers").font(.title).padding([.leading, .trailing], 16)
            List {
                ForEach(sortedVillagers.indices){ index in
                    if isVillagerGiftable(villagerKey: sortedVillagers[index].key, gifts: villagerVM.gifts){
                        NavigationLink {
                            VillagerDetailView(villagerKey: sortedVillagers[index].key)
                        } label: {Text(sortedVillagers[index].key)}
                    }
                }
            }
        }
    }
}
private func isVillagerGiftable(villagerKey: String, gifts: [Gift]) -> Bool {
    for item in gifts {
        if item.name == villagerKey { return true }
    }
    return false
}

struct VillagerListView_Previews: PreviewProvider {
    static var previews: some View {
        VillagerListView()
    }
}
