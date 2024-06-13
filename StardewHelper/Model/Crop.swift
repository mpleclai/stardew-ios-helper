//
//  Crop.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/24/24.
//

import Foundation

struct Crop: Hashable, Codable {
    let seasons: [String]
    let daysInPhase: [Int]
    let regrowDays: Int
    let isRaised: Bool
    let isPaddyCrop: Bool
    let needsWatering: Bool
    let harvestMethod: String
    let harvestItemId: String
    let harvestMinStack: Int
    let harvestMaxStack: Int
    enum CodingKeys: String, CodingKey {
        case seasons = "Seasons"
        case daysInPhase = "DaysInPhase"
        case regrowDays = "RegrowDays"
        case isRaised = "IsRaised"
        case isPaddyCrop = "IsPaddyCrop"
        case needsWatering = "NeedsWatering"
        case harvestMethod = "HarvestMethod"
        case harvestItemId = "HarvestItemId"
        case harvestMinStack = "HarvestMinStack"
        case harvestMaxStack = "HarvestMaxStack"
    }
}
