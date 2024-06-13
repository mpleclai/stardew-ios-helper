//
//  StandardBundleDetailView.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/29/24.
//

import Foundation
import SwiftUI

struct StandardBundleDetailView: View {
    @EnvironmentObject private var bundleVM: BundleViewModel
    @ObservedObject var vm: CoreDataViewModel

    var bundle: StandardBundle
    var area: String

    var body: some View {
        VStack( alignment: HorizontalAlignment.leading) {
            Text(bundle.bundleName).font(.title).padding([.leading, .trailing], 16)
            Text("Room: " + area).font(.title3).padding([.leading, .trailing], 16)

            StandardBundleRewardView(reward: bundle.reward, objects: bundleVM.gameObjects, bigCraftables: bundleVM.bigCraftables)

            List {
                ForEach(bundle.objectsNeeded, id: \.self) { item in
                    StandardBundleItemView(item: item, objects: bundleVM.gameObjects, vm: vm, name: bundle.bundleName)
                }
            }.listStyle(.insetGrouped)
        }
    }
}

struct StandardBundleRewardView: View {
    var reward: Reward?
    var objects: [String: GameObject]
    var bigCraftables: [String: BigCraftable]

    @State private var isOn = false
    var body: some View {
        let id = reward?.rewardId
        let type = reward?.rewardType
        let count = reward?.rewardCount

        let rewardCount = (count == nil ? String("") : " x " + String(count!))

        ZStack {
            RoundedRectangle(cornerRadius: 8.0)
                .fill(.quaternary)
                .frame(minWidth: 10, maxWidth: .infinity, minHeight: 10, maxHeight: 50)
            if id == nil {
                Text("Reward: Movie Theater") // Missing Bundle
            } else {
                if type == "BO" {
                    HStack {
                        Text("Reward: ")
                        Text(
                            LocalizedStringKey(getIdFromString(string: bigCraftables[id ?? ""]?.displayName ?? "Error")),
                            tableName: "BigCraftables"
                        )
                        Text(rewardCount)
                    }
                } else {
                    HStack {
                        Text("Reward: ")
                        Text(
                            LocalizedStringKey(getIdFromString(string: objects[id ?? ""]?.displayName ?? "Error")),
                            tableName: "ObjectStrings"
                        )
                        Text(rewardCount)
                    }
                }
            }
        }.padding([.leading, .trailing, .bottom], 16)
    }
}

struct StandardBundleItemView: View {
    var item: BundleItem
    var objects: [String: GameObject]
    @ObservedObject var vm: CoreDataViewModel
    var name: String

    @State private var isOn = false
    var body: some View {
        Button(
            action: {
                isOn.toggle()
                if isOn {
                    var newIdList : [BundleItem] = vm.collectedStandardBundles[name] ?? []
                    newIdList.append(item)
                    vm.collectedStandardBundles[name] = newIdList
                    vm.updateStandardBundlesCollection(profile: vm.selectedProfile ?? ProfileEntity(), bundles: vm.collectedStandardBundles)
                } else {
                    var newIdList : [BundleItem] = vm.collectedStandardBundles[name] ?? []
                    newIdList.removeAll(where: { (thing: BundleItem) -> Bool in
                        thing == item
                    })
                    vm.collectedStandardBundles.removeValue(forKey: name)
                    vm.collectedStandardBundles[name] = newIdList
                    vm.updateStandardBundlesCollection(profile: vm.selectedProfile ?? ProfileEntity(), bundles: vm.collectedStandardBundles)
                }
            },
            label: {
                HStack {
                    let itemId = getIdFromString(string: objects[item.id]?.displayName ?? ("Error " + item.id))
                    HStack {
                        if item.minQuality != 0 {
                            let quality = qualityCalc(quality: item.minQuality)
                            if quality != nil {Text(quality!)}
                        }
                        if itemId.contains("-388") {
                            Text(LocalizedStringKey("Wood_Name"), tableName: "ObjectStrings")
                            Text("x " + String(item.numNeeded))
                        } else if itemId.contains("Error") {
                            Text(String(item.numNeeded) + "g")
                        } else {
                            Text(LocalizedStringKey(itemId), tableName: "ObjectStrings")
                            Text("x " + String(item.numNeeded))
                        }
                    }
                    Spacer()
                    if isOn {Image(systemName: "checkmark").foregroundColor(.green).imageScale(.large)}
                }
            }
        ).foregroundColor(.primary)
        .onAppear(perform: {
            vm.fetchSelectedProfile()
            vm.fetchStandardBundlesCollection(profile: vm.selectedProfile ?? ProfileEntity())
            if itemStatus(item: item, items: vm.collectedStandardBundles[name] ?? []) {
                isOn = true
            } else {
                isOn = false
            }
        })
    }
    func itemStatus(item: BundleItem, items: [BundleItem]) -> Bool {
        for bundleItem in items {
            if(bundleItem == item){
                return true
            }
        }
        return false
    }
}

/**
 * Translate int value to its string value indicating quality
 *
 * @param quality - the integer value to translate to its corresponding string value
 */
private func qualityCalc(quality: Int) -> String? {
    switch quality {
    case 1: return "Silver"
    case 2: return "Gold"
    case 3: return "Iridium"
    default: return nil
    }
}
