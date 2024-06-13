//
//  HomeView.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 8/8/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var vm: CoreDataViewModel

    @EnvironmentObject private var villagerVM: VillagerViewModel
    @EnvironmentObject private var cropVM: CropViewModel
//    @EnvironmentObject private var museumVM: MuseumViewModel

    let defaultGameObject = GameObject(name: "", displayName: "", description: "", type: "", category: 0, price: 0, excludeFromFishingCollection: true, excludeFromShippingCollection: true, excludeFromRandomSale: true)

    var body: some View {
        VStack {
            
            if vm.selectedProfile != nil {
                dateSection
            }

            List {
//                ForEach(Array(vm.collectedFish.keys), id: \.self) { key in
//                    Text(vm.collectedFish[key]?.name ?? "Error")
//                }
                profileSection
                if vm.selectedProfile != nil {
                    remindersSection
                }
            }
        }
    }
}
extension HomeView {

    private var profileSection : some View {
        Section {
            NavigationLink(destination: ProfileView(vm: vm)) {
                if vm.selectedProfile == nil {
                    Text("Select or Create a profile")
                } else {
                    Image(systemName: "person.crop.circle.fill")
                        .foregroundColor(colorStringToColor(colorString: vm.selectedProfile?.color ?? ""))
                    Text(vm.selectedProfile?.name ?? "New Profile")
                }
            }
        } header: {
            Text("Selected Profile")
        }
    }

    private var dateSection: some View {
        VStack {
            if vm.selectedProfile != nil {
                let profile = vm.selectedProfile
                let season = profile?.dateSeason ?? "Spring"
                let day: Int = Int(profile?.dateDay ?? 0)
                let year: Int = Int(profile?.dateYear ?? 0)
                let name: String = profile?.name ?? "Name"
                let color =  profile?.color ?? ""

                HStack {Text(dateToDayOfWeek(day: day))}
                HStack {
                    Spacer()
                    Button(
                        action: {
                            if !(day == 1 && year == 1 && season == "Spring") {
                                vm.updateProfile(profile: profile, name: name, color: color, date: handleDateIncrement(profile: profile, subtract: true), museumCollection: dictionaryToJson(dictionary: vm.collectedMuseumItems))
                                vm.selectedProfile = profile // Update selected profile with new data
                            }
                        },
                        label: {Image(systemName: "minus")}
                    )
                    Spacer()
                    Text(formStringFromEntityDate(profile: vm.selectedProfile ?? ProfileEntity()))
                    Spacer()
                    Button(
                        action: {
                            vm.updateProfile(profile: profile, name: name, color: color, date: handleDateIncrement(profile: profile, subtract: false), museumCollection: dictionaryToJson(dictionary: vm.collectedMuseumItems))
                            vm.selectedProfile = profile // Update selected profile with new data
                        },
                        label: {Image(systemName: "plus")}
                    )
                    Spacer()
                }
            }
        }
    }

    private var remindersSection : some View {
        Section {
            let profile = vm.selectedProfile
            let day: Int = Int(profile?.dateDay ?? 0)
            let season: String = profile?.dateSeason ?? ""
            let weekday = dateToDayOfWeek(day: day)

            if weekday == "Friday" || weekday == "Sunday" {Text("Traveling cart in Cindersap Forest")}
            if weekday == "Friday" {Text("Krobus selling iridium sprinkler")} // krobus stock
            if day == 28 {Text("Last day of season")}
            if vm.selectedProfile != nil {
                birthdayList
                cropList
//                Text(isFestivalDay(day: day, season: season))
            }
        } header: {
            Text("Reminders")
        }

    }

    private var birthdayList: some View {
        Section {
            let villagersDict = villagerVM.villagers
            let defaultVillager = Villager(displayName: "", birthSeason: "", birthday: 1, region: "", romancable: false, canRecieveGifts: false)
            ForEach(Array(villagersDict.keys), id: \.self) { key in
                if isVillagersBirthday(villager: villagersDict[key] ?? defaultVillager) {
                    HStack {
                        Image(systemName: "birthday.cake")
                        Text(key + "'s Birthday")
                    }
                }
            }
        }
    }

    private var cropList: some View {
        Section {
            let cropsDict = cropVM.crops
            let defaultCrop = Crop(seasons: [], daysInPhase: [], regrowDays: 0, isRaised: false, isPaddyCrop: false, needsWatering: false, harvestMethod: "", harvestItemId: "", harvestMinStack: 0, harvestMaxStack: 0)
            ForEach(Array(cropsDict.keys), id: \.self) { key in
                if isLastDayToPlant(crop: cropsDict[key] ?? defaultCrop) {
                    HStack {
                        Image(systemName: "carrot")
                        Text("Last day to plant:").font(.caption)
                        Text(LocalizedStringKey(getIdFromString(string: cropVM.gameObjects[key]?.displayName ?? "Error")), tableName: "ObjectStrings")
                    }
                }
            }
        }
    }

    private func isVillagersBirthday(villager: Villager) -> Bool {
        let profile = vm.selectedProfile
        if villager.birthSeason == profile?.dateSeason && villager.birthday == profile?.dateDay ?? 0 {
            return true
        }
        return false
    }
    private func isLastDayToPlant(crop: Crop) -> Bool {
        let lastDay = getLastDayToPlant(crop: crop)
        let currentDay = vm.selectedProfile?.dateDay ?? 0
        let currentSeason = vm.selectedProfile?.dateSeason
        if lastDay == currentDay && currentSeason == getLastSeasonToPlant(crop: crop) {
            return true
        }
        return false
    }
//    private func isFestivalDay(day: Int, season: String) -> String {
//        switch season {
//        case "Spring": if(day == 13){ } else if (day == 15 || day == 16 || day == 17) {} else if {}
//            case "Summer" :
//            case "Fall" :
//            case "Winter":
//            default:""
//        }
//        
//    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(vm: CoreDataViewModel()).environment(\.locale, .init(identifier: "es"))
    }
}
