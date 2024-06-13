//
//  MoreView.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 8/8/22.
//

import SwiftUI

// A struct to store menu item data
struct MenuItem: Identifiable {
    let id = UUID()
    let headline: String
    let icon: String
}

// A view that shows the data for one Menu Item.
struct MenuRow: View {
    var menuItem: MenuItem

    var body: some View {
        HStack {
            Image(systemName: menuItem.icon)
            Text("\(menuItem.headline)")
        }
    }
}

let menuItems = [
    MenuItem(headline: "Villagers", icon: "heart.square"),
    MenuItem(headline: "Crops", icon: "carrot.fill"),
    MenuItem(headline: "Fishing", icon: "fish.fill"),
    MenuItem(headline: "Locations", icon: "location.fill"),
    MenuItem(headline: "Bundles", icon: "app.gift.fill"),
    MenuItem(headline: "Farm Animals", icon: "hare"),
    MenuItem(headline: "Museum", icon: "fossil.shell.fill")
]

struct MoreView: View {
    @ObservedObject var vm: CoreDataViewModel

    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CropListView()) {
                    MenuRow(menuItem: menuItems[1])
                }
                NavigationLink(destination: FishListView(vm: vm)) {
                    MenuRow(menuItem: menuItems[2])
                }
                NavigationLink(destination: LocationListView()) {
                    MenuRow(menuItem: menuItems[3])
                }
                NavigationLink(destination: FarmAnimalListView()) {
                    MenuRow(menuItem: menuItems[5])
                }
            }.navigationBarTitle("Stardew Helper App")
        }
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView(vm: CoreDataViewModel())
    }
}
