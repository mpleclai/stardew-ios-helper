//
//  VillagerDetailView.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/24/24.
//

import Foundation
import SwiftUI

struct VillagerDetailView: View {
    @EnvironmentObject private var villagerVM: VillagerViewModel
    var villagerKey: String

    @State private var selectedView = "General info"
    var characterViews = ["General info", "Gifts", "Schedule"]

    @State private var universalPreferencesOn = false

    var body: some View {
        VStack {
            HStack(alignment: VerticalAlignment.center) {Text(villagerKey).font(.title).padding([.leading, .trailing], 16)}
            Picker("Views", selection: $selectedView) {
                ForEach(characterViews, id: \.self) { Text($0) }
            }.pickerStyle(.segmented).padding(.horizontal)

            switch selectedView {
                case "General info": generalView
                case "Gifts": giftView
                default: scheduleView
            }
        }
    }
}

struct GiftSection: View {
    var title: String
    var universalGifts: [String]
    var gifts: [String]

    var body: some View {
        Section {
            ForEach(Array(universalGifts), id: \.self) { gift in
                HStack {
                    Image(systemName: "globe")
                    Text(LocalizedStringKey(gift), tableName: "ObjectStrings")
                }
            }
            ForEach(Array(gifts), id: \.self) { gift in
                HStack {
                    Text(LocalizedStringKey(gift), tableName: "ObjectStrings")
                }
            }
        } header: {Text(title)}
    }
}

enum Affinity {
    case love
    case like
    case neutral
    case dislike
    case hate
    case item
}

extension VillagerDetailView {
    private var generalView : some View {
        List {
            let defaultVillager = Villager(displayName: "", birthSeason: nil, birthday: 0, region: "", romancable: false, canRecieveGifts: false)
            let villager = villagerVM.villagers[villagerKey] ?? defaultVillager

            // DataRow(label: "Display Name", value: villager.displayName)
            DataRow(label: "Romanceable", value: String(villager.romancable).capitalized)
            if villager.birthSeason != nil {DataRow(label: "Birthday", value: (villager.birthSeason ?? "") + " " + String(villager.birthday))}
            DataRow(label: "Region", value: villager.region)
        }
    }

    private var giftView : some View {
        List {
            let universalLoved = getGifts(recipient: "Universal Love", affinity: Affinity.item)
            let universalLiked = getGifts(recipient: "Universal Like", affinity: Affinity.item)
            let universalNeutral = getGifts(recipient: "Universal Neutral", affinity: Affinity.item)
            let universalDisliked = getGifts(recipient: "Universal Dislike", affinity: Affinity.item)
            let universalHated = getGifts(recipient: "Universal Hate", affinity: Affinity.item)

            let lovedGifts = getGifts(recipient: villagerKey, affinity: Affinity.love)
            let likedGifts = getGifts(recipient: villagerKey, affinity: Affinity.like)
            let neutralGifts = getGifts(recipient: villagerKey, affinity: Affinity.neutral)
            let dislikedGifts = getGifts(recipient: villagerKey, affinity: Affinity.dislike)
            let hatedGifts = getGifts(recipient: villagerKey, affinity: Affinity.hate)
            Section {
                Toggle(isOn: $universalPreferencesOn) {
                    Text("Toggle Universal Preferences")
                }.toggleStyle(.switch)
            } footer: {Text("* Note - does not account for individual exceptions")}

            if universalPreferencesOn {
                GiftSection(title: "Loves", universalGifts: universalLoved, gifts: lovedGifts)
                GiftSection(title: "Likes", universalGifts: universalLiked, gifts: likedGifts)
                GiftSection(title: "Neutral", universalGifts: universalNeutral, gifts: neutralGifts)
                GiftSection(title: "Dislikes", universalGifts: universalDisliked, gifts: dislikedGifts)
                GiftSection(title: "Hates", universalGifts: universalHated, gifts: hatedGifts)
            } else {
                GiftSection(title: "Loves", universalGifts: [], gifts: lovedGifts)
                GiftSection(title: "Likes", universalGifts: [], gifts: likedGifts)
                GiftSection(title: "Neutral", universalGifts: [], gifts: neutralGifts)
                GiftSection(title: "Dislikes", universalGifts: [], gifts: dislikedGifts)
                GiftSection(title: "Hates", universalGifts: [], gifts: hatedGifts)
            }
        }
    }

    private var scheduleView : some View {
        List() {
            Text("Schedule")
        }
    }

    private func getGifts(recipient: String, affinity: Affinity) -> [String] {
        var list: [String] = []
        for category in villagerVM.gifts {
            if category.name == recipient {
                let iterationCategory: [String] = switch affinity {
                    case .love: category.love ?? []
                    case .like: category.like ?? []
                    case .neutral: category.neutral ?? []
                    case .dislike: category.dislike ?? []
                    case .hate: category.hate ?? []
                    case .item: category.items ?? []
                }
                if !iterationCategory.isEmpty {
                    for item in iterationCategory {
                        if item.contains("-") || item.contains("category") {
                            list.append("All " + (villagerVM.categories[item]?.displayName ?? "error"))
                        } else if item.contains("374") {
                            // Do nothing
                        } else {
                            list.append(getIdFromString(string: villagerVM.gameObjects[item]?.displayName ?? "Error" + item))
                        }
                    }
                }
            }
        }
        return list
    }
}
