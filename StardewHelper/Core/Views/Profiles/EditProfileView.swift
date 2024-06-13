//
//  EditProfileView.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/30/24.
//

import SwiftUI

struct EditProfileView: View {
    @State var profile: ProfileEntity?

//    @EnvironmentObject private var profileVM: ProfileViewModel
    @EnvironmentObject private var bundlesVM: BundleViewModel

    @Environment(\.dismiss) var dismiss

    @State private var showCheckmark: Bool = false
    @ObservedObject var vm: CoreDataViewModel

    let defaultGameObject = GameObject(name: "", displayName: "", description: "", type: "", category: 0, price: 0, excludeFromFishingCollection: true, excludeFromShippingCollection: true, excludeFromRandomSale: true)

    // Picker Options
    @State private var seasonOptions = ["Spring", "Summer", "Fall", "Winter"]
    var bundleOption = ["Standard Bundles", "Remixed Bundles"]
    var colorOption = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Pink"]

    // Selected Settings
    @State private var profileName: String = ""
    @State private var selectedSeason = "Spring"
    @State private var selectedDay = 1
    @State private var selectedYear = 1
    @State private var selectedColor = "Pink"
    @State private var selectedBundle = "Standard"
    
    
    @State private var selectedCrafts1 = "Construction"
    @State private var selectedCrafts2 = "Exotic"
    @State private var selectedPantry1 = "Quality Crops"
    @State private var selectedPantry2 = "Animal"
    @State private var selectedPantry3 = "Exotic"
    @State private var selectedFishTank = "Artisan"
    @State private var selectedBoiler = Set<String>()
    @State private var selectedBulletin = Set<String>()

//    @State private var selectedBoiler = "Exotic"
//    @State private var selectedBulletin = "Exotic"


    @State private var crafts1 = ["Construction", "Sticky", "Forest"]
    @State private var crafts2 = ["Exotic", "Wild Medicine"]
    @State private var pantry1 = ["Quality Crops", "Rare Crops"]
    @State private var pantry2 = ["Animal", "Fish Farmer's", "Garden"]
    @State private var pantry3 = ["Artisan", "Brewer's"]
    @State private var fishTank = ["Specialty", "Quality", "Master Fisher's"]
    //3 of
    @State private var boiler = ["Blacksmith's", "Geologist's", "Adventurer's", "Treasure hunter's", "Engineers"]
    //5 of
    @State private var bulletin = ["Chef", "Dye", "Field Research", "Fodder", "Enchanter", "Children's", "Home Cook", "Helpers", "Spirits Eve", "Engineer's"]
    

    @State private var isOn: Bool = false

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $profileName).textFieldStyle(.automatic)
                Picker("Profile Icon Color", selection: $selectedColor) {
                    ForEach(colorOption, id: \.self) { color in Text(color)}
                }
            }
            datePickers
            bundlePickers
                // 3
          
        }
        .onAppear {
            if let profile = profile {
                self.profileName = profile.name ?? ""
                self.selectedColor = profile.color ?? "Pink"
                self.selectedDay = Int(profile.dateDay)
                self.selectedYear = Int(profile.dateYear)
                self.selectedSeason = profile.dateSeason ?? "Spring"
            }
        }
        .navigationBarTitle("Edit Profile")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                HStack {
                    Image(systemName: "checkmark").imageScale(.medium)
                        .opacity(showCheckmark ? 1.0 : 0.0)
                    Button(
                        action: {
                            if profile == nil {
                                vm.addProfile(
                                    name: profileName,
                                    day: selectedDay,
                                    year: selectedYear,
                                    season: selectedSeason,
                                    color: selectedColor
                                )
                            } else {
                                vm.updateProfile(
                                    profile: profile ?? ProfileEntity(),
                                    name: profileName,
                                    color: selectedColor,
                                    date: ProfileDate(season: selectedSeason, day: selectedDay, year: selectedYear),
                                    museumCollection: "{}"
                                )
                            }
                            if profile?.id == vm.selectedProfile?.id {
                                vm.selectedProfile = profile // Update selected profile with new data
                            }
                            dismiss()
                        },
                        label: {Text("Save")}
                    )
                }.padding(10)
            }
        }
    }
}

extension EditProfileView {
    private var datePickers : some View {
        Section {
            HStack {
                VStack {
                    Text("Season").padding([.top], 20)
                    Divider()
                    Picker("Season", selection: $selectedSeason) {
                        ForEach(seasonOptions, id: \.self) { season in
                            Text(season)
                        }
                    }.pickerStyle(.wheel)

                }
                VStack {
                    Text("Day").padding([.top], 20)
                    Divider()
                    Picker("Day", selection: $selectedDay) {
                        ForEach(1 ... 28, id: \.self) { i in
                            Text(String(i))
                        }
                    }
                }
                VStack {
                    Text("Year").padding([.top], 20)
                    Divider()
                    Picker("Year", selection: $selectedYear) {
                        ForEach(1...150, id: \.self) { i in
                            Text(String(i))
                        }
                    }
                }
            }.pickerStyle(.wheel)
           
        }header: {
            Text("Date Settings")
        }
    }

    private var bundlePickers : some View {
        Section {
            Picker("Bundle Type", selection: $selectedBundle) {
                ForEach(bundleOption, id: \.self) { color in
                    Text(color)
                }
            }

            if selectedBundle == "Remixed Bundles" {
                Section {
                    // Probably want a multi select or something

                    // Crafts room
                    Picker("Crafts 1", selection: $selectedCrafts1) {
                        ForEach(crafts1, id: \.self) { bundle in Text(bundle)}
                    }.pickerStyle(.wheel)
                    
                    Picker("Crafts 2", selection: $selectedCrafts2) {
                        ForEach(crafts2, id: \.self) { bundle in Text(bundle)}
                    }.pickerStyle(.wheel)

                    // Pantry
                    Picker("Pantry 1", selection: $selectedPantry1) {
                        ForEach(pantry1, id: \.self) { bundle in Text(bundle)}
                    }.pickerStyle(.wheel)
                    
                    Picker("Pantry 2", selection: $selectedPantry2) {
                        ForEach(pantry2, id: \.self) { bundle in Text(bundle)}
                    }.pickerStyle(.wheel)
                    
                    Picker("Pantry 3", selection: $selectedPantry3) {
                        ForEach(pantry3, id: \.self) { bundle in Text(bundle)}
                    }.pickerStyle(.wheel)

   
                    List(boiler, id: \.self, selection: $selectedBoiler) { item in
                        Text(item)
                    }
                  
                    // boiler room -- 3 of
                    // blacksmiths, geologists, adventurers, treasure hunters, engineers

                    // bulletin board --- 5 of
                    // chef, dye, field research, fodder, enchanter,childrens, foragers, home cook, helpers, spirits eve, winter star

                }header: {
                    Text("Selected Remixed Bundles to display")
                }
            }
        }header: {
            Text("Bundle Settings")
        }
    }
}
// #Preview {
//    EditProfileView()
// }
