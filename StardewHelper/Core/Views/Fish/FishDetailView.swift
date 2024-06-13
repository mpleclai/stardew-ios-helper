//
//  FishDetailView.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 7/6/22.
//

import SwiftUI

struct FishDetailView: View {
    var fish: Fish
    @ObservedObject var vm: CoreDataViewModel
    @EnvironmentObject private var locationVM: LocationViewModel

    @State private var isOn = false

    var body: some View {
        VStack() {
            HStack(alignment: VerticalAlignment.center) {
                Text(LocalizedStringKey(getLocalizedIdFromName(string: fish.name)), tableName: "ObjectStrings")
                    .font(.title).padding([.leading, .trailing], 16)
            }
            List {
                if fish.type == "trap" {
                    DataRow(label: "Type: ", value: String(fish.type ?? "n/a"))
                    DataRow(label: "Chance: ", value: String(fish.chance ?? 0))
                    DataRow(label: "Location: ", value: String(fish.location ?? "n/a"))
                    HStack {
                        Text("Is Caught: ")
                        Spacer()
                        Toggle(isOn: $isOn) {}.labelsHidden().toggleStyle(.checklist)
                    }
                } else {
                    DataRow(label: "Chance to Dart: ", value: String(fish.chanceToDart ?? 0))
                    DataRow(label: "Darting Randomness: ", value: fish.dartingRandomness ?? "n/a")
                    DataRow(label: "Time: ", value: formatTimes(fish: fish))
                    DataRow(label: "Weather: ", value: fish.weather ?? "n/a")
                    DataRow(label: "Min Fishing Level: ", value: String(fish.fishingLevel ?? 0))
//                    VStack{
//                        ForEach(Array(locationVM.locations.keys), id: \.self) { key in
//                            ForEach(locationVM.locations[key]?.fish ?? []){ item in
//                                if(item.id == fish.id){
//                                    Text(locationVM.locations[key])
//                                }
//                            }
//                        }
//                    }
                }
                if(vm.selectedProfile != nil){
                    Button(
                        action: {
                            isOn.toggle()
                            if isOn {
                                vm.collectedFish[fish.id] = fish
                                vm.updateFishCollection(profile: vm.selectedProfile ?? ProfileEntity(), fishDict: vm.collectedFish)
                            } else {
                                vm.collectedFish.removeValue(forKey: fish.id)
                                vm.updateFishCollection(profile: vm.selectedProfile ?? ProfileEntity(), fishDict: vm.collectedFish)
                            }
                        },
                        label: {
                            HStack {
                                Text("Is Caught: ")
                                Spacer()
                                if isOn {Image(systemName: "checkmark").foregroundColor(.green).imageScale(.large)}
                            }
                        }
                    ).foregroundColor(.primary)
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
            }
        }
    }
    
    func itemStatus(item: Fish?, fishId: String, dict: [String: Fish]) -> Bool {
        if dict[fishId] == item {
            return true
        }
        return false
    }
}

private func formatTimes(fish: Fish) -> String {
    return String(fish.time?.minTime ?? 0) + " - " + String(fish.time?.maxTime ?? 0)
}
