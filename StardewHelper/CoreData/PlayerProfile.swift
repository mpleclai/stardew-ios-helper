//
//  PlayerProfile.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/30/24.
//

import Foundation

struct PlayerProfile: Hashable, Identifiable {
    let id: UUID = UUID()
    var name: String
    var date: ProfileDate
    var color: String
    var usingRemixed: Bool
    var selectedBundles: [Bool: String]
    var completedBundles: [Bool: String]
    var completedMuseumItems: [Bool: String]
    var completedFishingItems: [Bool: String]

    func updateSettings(newName: String) -> PlayerProfile {
        return PlayerProfile(name: newName, date: date, color: color, usingRemixed: usingRemixed, selectedBundles: selectedBundles, completedBundles: completedBundles, completedMuseumItems: completedMuseumItems, completedFishingItems: completedFishingItems)
    }
}

struct ProfileDate: Hashable, Codable {
    let season: String
    let day: Int
    let year: Int
}
