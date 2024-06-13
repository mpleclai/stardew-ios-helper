//
//  MuseumView.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 8/8/22.
//

import SwiftUI

let gemCategory = "-2"
let archCategory = "Arch"
let mineralCategory = "-12"

struct MuseumView: View {
    @EnvironmentObject private var museumVM: MuseumViewModel
    @ObservedObject var vm: CoreDataViewModel

    var body: some View {
        VStack(alignment: .center) {
            Text("Museum").font(.title).padding([.leading, .trailing], 16)
            if vm.selectedProfile != nil {
                let sortedItems = museumVM.gameObjects.sorted(by: {$0.value.name < $1.value.name})

                List {
                    MuseumTitleView(category: "Gems", total: 12)
                 
                    ForEach(sortedItems.indices){index in
                        if String(museumVM.gameObjects[sortedItems[index].key]?.category ?? -200) == gemCategory {
                            MuseumItemView(item: museumVM.gameObjects[sortedItems[index].key], key: sortedItems[index].key, vm: vm)
                        }
                    }

                    MuseumTitleView(category: "Artifacts", total: 42)
                    ForEach(sortedItems.indices){index in
                        if String(museumVM.gameObjects[sortedItems[index].key]?.type ?? "") == archCategory {
                            MuseumItemView(item: museumVM.gameObjects[sortedItems[index].key], key: sortedItems[index].key, vm: vm)
                        }
                    }

                    MuseumTitleView(category: "Minerals", total: 41)
                    ForEach(sortedItems.indices){index in
                        if String(museumVM.gameObjects[sortedItems[index].key]?.category ?? -200) == mineralCategory {
                            MuseumItemView(item: museumVM.gameObjects[sortedItems[index].key], key: sortedItems[index].key, vm: vm)
                        }
                    }
                }.listStyle(.insetGrouped)
            }
        }
    }
}

struct MuseumTitleView: View {
    var category: String
    var total: Int

    var body: some View {
        let headerBgColor = Color(UIColor.secondarySystemFill)
        Text(category + ": " + String(total) + " items")
            .font(.title3).bold().listRowBackground(headerBgColor)
    }
}

struct MuseumItemView: View {
    var item: GameObject?
    var key: String

    @EnvironmentObject private var museumVM: MuseumViewModel
    @ObservedObject var vm: CoreDataViewModel
    @State var isOn: Bool = false

    var body: some View {
        Button(
            action: {
                isOn.toggle()
                if isOn {
                    vm.collectedMuseumItems[key] = item
                    vm.updateMuseumCollection(profile: vm.selectedProfile ?? ProfileEntity(), museumDict: vm.collectedMuseumItems)
                } else {
                    vm.collectedMuseumItems.removeValue(forKey: key)
                    vm.updateMuseumCollection(profile: vm.selectedProfile ?? ProfileEntity(), museumDict: vm.collectedMuseumItems)
                }
            },
            label: {
                HStack {
                    Text(LocalizedStringKey(getIdFromString(string: item?.displayName ?? "")), tableName: "ObjectStrings")
                    Spacer()
                    if isOn {Image(systemName: "checkmark").foregroundColor(.green).imageScale(.large)}
                }
            }
        ).foregroundColor(.primary)
        .onAppear(perform: {
            vm.fetchSelectedProfile()
            vm.fetchMuseumCollection(profile: vm.selectedProfile ?? ProfileEntity())
            if itemStatus(item: item, key: key, dict: vm.collectedMuseumItems) {
                isOn = true
            } else {
                isOn = false
            }
        })
    }
}

func itemStatus(item: GameObject?, key: String, dict: [String: GameObject]) -> Bool {
    if dict[key] == item {
        return true
    }
    return false
}
