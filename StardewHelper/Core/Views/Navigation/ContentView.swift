//
//  ContentView.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 7/5/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var fishVM = FishViewModel()
    @StateObject var cropVM = CropViewModel()
    @StateObject var villagerVM = VillagerViewModel()
    @StateObject var farmAnimalVM = FarmAnimalViewModel()
    @StateObject var locationVM = LocationViewModel()
    @StateObject var bundleVM = BundleViewModel()
    @StateObject var museumVM = MuseumViewModel()
    @StateObject var vm = CoreDataViewModel()

    var body: some View {
        NavigationView {
            TabView {
                Group {
                    HomeView(vm: vm)
                        .tabItem {
                            Label("Home", systemImage: "house" )
                        }
                    VillagerListView()
                        .tabItem {
                            Label("Villagers", systemImage: "heart.square" )
                        }
                    BundleListView(vm: vm)
                        .tabItem {
                            Label("Bundles", systemImage: "app.gift" )
                        }
                    MuseumView(vm: vm)
                        .tabItem {
                            Label("Museum", systemImage: "fossil.shell.fill" )
                        }
                    MoreView(vm: vm)
                        .tabItem {
                            Label("Lookup", systemImage: "ellipsis" )
                        }
                }.toolbarBackground(.visible, for: .tabBar)
            }
        }.environmentObject(fishVM)
            .environmentObject(cropVM)
            .environmentObject(villagerVM)
            .environmentObject(farmAnimalVM)
            .environmentObject(locationVM)
            .environmentObject(bundleVM)
            .environmentObject(museumVM)
            .environmentObject(vm)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().preferredColorScheme(.dark)
    }
}
