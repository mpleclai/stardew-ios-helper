//
//  LocationListView.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 7/7/22.
//

import SwiftUI

struct LocationListView: View {
    @EnvironmentObject private var locationVM: LocationViewModel

    // Add default data to all other fields

    var body: some View {
        var sortedLocations = locationVM.locations.sorted{$0.key < $1.key}

        List {
            ForEach(sortedLocations.indices){ index in
                if !((locationVM.locations[sortedLocations[index].key]?.artifacts.isEmpty ?? true) &&
                    (locationVM.locations[sortedLocations[index].key]?.fish.isEmpty ?? true) &&
                    (locationVM.locations[sortedLocations[index].key]?.forage.isEmpty ?? true)) {
                    NavigationLink {
                        LocationDetailView(locationKey: sortedLocations[index].key)
                    } label: {
                        Text(sortedLocations[index].key)
                    }
                }
                
            }
        }
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
    }
}
