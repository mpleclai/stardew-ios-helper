//
//  FishRow.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/22/24.
//

import Foundation
import SwiftUI

struct FishRow: View {
    var fish: Fish
    @ObservedObject var vm: CoreDataViewModel

    @State private var isOn = false
    var body: some View {
        HStack {
            if(isOn){
                Image(systemName: "checkmark.circle").foregroundColor(.green).imageScale(.large)
            } else {
                Image(systemName: "circle").foregroundColor(.gray).imageScale(.large).opacity(0.5)
            }
            Text(LocalizedStringKey(fish.name.trimmingAllSpaces() + "_Name"), tableName: "ObjectStrings")
            Spacer()
        }.foregroundColor(.primary)
        .onAppear(perform: {
            vm.fetchSelectedProfile()
            vm.fetchFishCollection(profile: vm.selectedProfile ?? ProfileEntity())
            if itemStatus(item: fish, fishId: fish.id, dict: vm.collectedFish) {
                isOn = true
            } else {
                isOn = false
            }
        })
    }
    func itemStatus(item: Fish?, fishId: String, dict: [String: Fish]) -> Bool {
        if dict[fishId] == item {
            return true
        }
        return false
    }
}
