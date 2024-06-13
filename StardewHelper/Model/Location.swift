//
//  Location.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/24/24.
//

import Foundation

struct Location: Hashable, Codable {
    let displayName: String?
    let artifacts: [Artifact]
//    let fishAreas : [String : FishArea]
    let fish: [LocationFish]
    let forage: [Foragable]
    enum CodingKeys: String, CodingKey {
        case displayName = "DisplayName"
        case artifacts = "ArtifactSpots"
//        case fishAreas = "FishAreas"
        case fish = "Fish"
        case forage = "Forage"
    }
}

struct Foragable: Hashable, Codable {
    let id: String
    let itemId: String?
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case itemId = "ItemId"
    }
}

// struct FishArea: Hashable, Codable {
//
// }

struct Artifact: Hashable, Codable {
    let id: String
    let itemId: String?
//    let displayName : String
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case itemId = "ItemId"
//      case chance = "Chance"
    }
}

struct LocationFish: Hashable, Codable {
    let id: String
    let itemId: String?
    let season: String?
    let condition: String?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case itemId = "ItemId"
        case season = "Season"
        case condition = "Condition"
//      case chance = "Chance"
    }
}

// struct LocationModel: Hashable, Codable, Identifiable {
//    let id: UUID = UUID()
//    var name: String
//    var spring_forage: [ForagableItem]? // Array of Forageables + chances [
//    var summer_forage: [ForagableItem]?
//    var fall_forage: [ForagableItem]?
//    var winter_forage: [ForagableItem]?
//    var spring_fish: [FishItem]? // Array of Fish + chances
//    var summer_fish: [FishItem]?
//    var fall_fish: [FishItem]?
//    var winter_fish: [FishItem]?
//    var artifacts: [ArtifactItem]? // Array of Artifacts + chances
