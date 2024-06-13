//
//  RemixBundleDetailView.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 7/8/22.
//

import SwiftUI

struct RemixBundleDetailView: View {
    @EnvironmentObject private var bundleVM: BundleViewModel
    @ObservedObject var vm: CoreDataViewModel
    var bundle: RemixBundle
    var area: BundleArea

    var body: some View {
        VStack( alignment: HorizontalAlignment.leading) {
            Text(bundle.name ?? "Error").font(.title).padding([.leading, .trailing], 16)
            Text("Room: " + area.areaName).font(.title3).padding([.leading, .trailing], 16)

            BundleRewardView(reward: (bundle.reward ?? "Error"))

            List {
                ForEach(splitBundleData(), id: \.self) { item in
                    BundleItemView(item: item, objects: bundleVM.gameObjects, vm: vm, bundleName: bundle.name ?? "")
                }
            }.listStyle(.insetGrouped)
        }
    }

    private func splitBundleData() -> [String] {
        return bundle.items?.components(separatedBy: ",") ?? ["Error"]
    }
}

struct BundleItemView: View {
    var item: String
    var objects: [String: GameObject]
    @ObservedObject var vm: CoreDataViewModel
    var bundleName: String
    
    @State private var isOn = false
    
    var body: some View {
        Button(action: {checkBundleAction()}, label: {buttonLabel})
            .onAppear(perform: {onAppearActions()})
    }
}

extension BundleItemView {
    
    private var buttonLabel : some View {
        HStack {
            if item.contains("182") {
                Text("1 ")
                Text(LocalizedStringKey(getIdFromString(string: objects["182"]?.displayName ?? "Error")), tableName: "ObjectStrings")
            } else if item.contains("174") {
                Text("1 ")
                Text(LocalizedStringKey(getIdFromString(string: objects["174"]?.displayName ?? "Error")), tableName: "ObjectStrings")
            } else {
                Text(item.trimmingPrefix(" "))
            }
            Spacer()
            if isOn {Image(systemName: "checkmark").foregroundColor(.green).imageScale(.large)}
        }
    }
    
    fileprivate func checkBundleAction() {
        isOn.toggle()
        var newIdList : [String] = vm.collectedRemixedBundles[bundleName] ?? []
        
        if isOn {
            newIdList.append(item)
        } else {
            newIdList.removeAll(where: { (itemName: String) -> Bool in itemName == item})
            vm.collectedRemixedBundles.removeValue(forKey: bundleName)
        }
        vm.collectedRemixedBundles[bundleName] = newIdList
        vm.updateRemixedBundlesCollection(profile: vm.selectedProfile ?? ProfileEntity(), bundles: vm.collectedRemixedBundles)
    }
    
    fileprivate func onAppearActions() {
        vm.fetchSelectedProfile()
        vm.fetchRemixedBundlesCollection(profile: vm.selectedProfile ?? ProfileEntity())
        if itemStatus(item: item, items: vm.collectedRemixedBundles[bundleName] ?? []) {
            isOn = true
        } else {
            isOn = false
        }
    }
    
    func itemStatus(item: String, items: [String]) -> Bool {
        for bundleItem in items {
            if(bundleItem == item){
                return true
            }
        }
        return false
    }
}
struct BundleRewardView: View {
    var reward: String

    @State private var isOn = false
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8.0)
                .fill(.quaternary)
                .frame(minWidth: 10, maxWidth: .infinity, minHeight: 10, maxHeight: 50)
            Text("Reward: " + reward)
        }.padding([.leading, .trailing, .bottom], 16)
    }
}
