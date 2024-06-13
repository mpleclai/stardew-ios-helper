//
//  LocationDetailView.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 7/7/22.
//

import SwiftUI

struct LocationDetailView: View {
    @EnvironmentObject private var locationVM: LocationViewModel
    var locationKey: String

    let defaultLocation = Location(displayName: "", artifacts: [], fish: [], forage: [])

    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            let location = locationVM.locations[locationKey] ?? defaultLocation
            Text(locationKey).font(.title).padding([.leading, .trailing], 16)
            List {
                Section {
                    ForEach(location.fish, id: \.self) { fish in
                        Text(LocalizedStringKey(determineObject(id: fish.id)), tableName: "ObjectStrings")
                    }
                } header: {Text("Fishing")}

                Section {
                    ForEach(location.forage, id: \.self) { forage in
                        Text(LocalizedStringKey(determineObject(id: forage.id)), tableName: "ObjectStrings")
                    }

                }header: {Text("Foraging")}

                Section {
                    ForEach(location.artifacts, id: \.self) { artifact in
                        Text(LocalizedStringKey(determineObject(id: artifact.id)), tableName: "ObjectStrings")
                    }
                }header: {Text("Artifact Spots")}
            }
        }
    }
    private func determineObject(id: String) -> String {
        let newString = id.components(separatedBy: ")")
        if newString.count > 1 {
//            if(newString[0] == "(O") {
//                return "O: " + (locationVM.gameObjects[newString[1]]?.name ?? "Error?:" + id)
//            } else if(newString[0] == "(F"){
//                return "F: " + (locationVM.furniture[newString[1]]?.name ?? "Error?:" + id)
//            }
            if newString[0] == "(O" {
                return getIdFromString(string: locationVM.gameObjects[newString[1]]?.displayName ?? "Error?:" + id)
            } else if newString[0] == "(F" {
                return (locationVM.furniture[newString[1]]?.name ?? "Error?:" + id)
            }
        }
        return "Error:" + id
    }
}
