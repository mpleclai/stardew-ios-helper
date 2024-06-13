//
//  BundleListView.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 7/8/22.
//

import SwiftUI

struct BundleListView: View {
    @EnvironmentObject private var bundlesVM: BundleViewModel

    @ObservedObject var vm: CoreDataViewModel
    @State private var selectedBundleView = "Standard"
    var bundleViews = ["Standard", "Remixed"]

    var body: some View {

        NavigationStack{
            if(vm.selectedProfile != nil){
                VStack {
                    Text("Community Center Bundles").font(.title).padding([.leading, .trailing], 16)
                    
                    Picker("Views", selection: $selectedBundleView) {
                        ForEach(bundleViews, id: \.self) { Text($0) }
                    }.pickerStyle(.segmented).padding(.horizontal)
                    
                    switch selectedBundleView {
                        case "Remixed": remixedView
                        default: standardView
                    }
                }
            }
        }
    }
}

extension BundleListView {
    
    private var remixedView : some View {
        List {
            let newRemixedData = bundlesVM.remixBundleData.sorted(by: {$0.areaName < $1.areaName})
            ForEach(newRemixedData, id: \.self) { bundleArea in
                Section {
                    ForEach(Array(bundleArea.bundleSets), id: \.self) { bundleSet in
                        BundleList(bundles: bundleSet.bundles, isSet: true, area: bundleArea, vm: vm)
                    }
                    BundleList(bundles: bundleArea.bundles, isSet: false, area: bundleArea, vm: vm)
                } header: {
                    Text(bundleArea.areaName)
                }
            }
        }
    }

    private var standardView : some View {
        List {
            let newArray = Array(Dictionary(grouping: bundlesVM.standardBundleData) {$0.roomName}.values)
            let newStandardData = newArray.sorted(by: {$0.first?.roomName ?? "" < $1.first?.roomName ?? ""})

            ForEach(newStandardData, id: \.self) { room in
                let roomName = room[0].roomName
                Section {
                    let sortedBundles = room.sorted(by: {$0.bundleName < $1.bundleName})
                    ForEach(sortedBundles, id: \.self) { bundle in
                        NavigationLink {
                            StandardBundleDetailView(vm: vm, bundle: bundle, area: bundle.roomName)
                        } label: {
                            HStack {Text(bundle.bundleName)}
                        }
                    }
                } header: {Text(roomName)}
            }
        }
    }
}
struct BundleList: View {
    var bundles: [RemixBundle]
    var isSet: Bool
    var area: BundleArea
    @ObservedObject var vm: CoreDataViewModel

    var body: some View {
        let sortedBundles = bundles.sorted(by: {$0.name ?? "" < $1.name ?? ""})

        ForEach(Array(sortedBundles), id: \.self) { bundleItem in
            NavigationLink {
                RemixBundleDetailView(vm: vm, bundle: bundleItem, area: area)
            } label: {
                HStack {
                    if isSet {Text("X")}
                    Text(bundleItem.name ?? "Error")
                }
            }
        }
    }
}

struct BundleListView_Previews: PreviewProvider {
    static var previews: some View {
        BundleListView(vm: CoreDataViewModel())
    }
}
