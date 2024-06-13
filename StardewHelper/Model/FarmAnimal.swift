//
//  FarmAnimal.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/24/24.
//

import Foundation

struct FarmAnimal: Hashable, Codable {
    let displayName: String
    let building: String?
    let purchasePrice: Int
    let sellPrice: Int
    let daysToMature: Int
    let daysToProduce: Int
    let harvestType: String
    let harvestTool: String?
    let produceItem: [ProduceItem]
    let deluxeProduceItem: [DeluxeProduceItem]

    enum CodingKeys: String, CodingKey {
        case displayName = "DisplayName"
        case building = "House"
        case purchasePrice = "PurchasePrice"
        case sellPrice = "SellPrice"
        case daysToMature = "DaysToMature"
        case daysToProduce = "DaysToProduce"
        case harvestType = "HarvestType"
        case harvestTool = "HarvestTool"
        case produceItem = "ProduceItemIds"
        case deluxeProduceItem = "DeluxeProduceItemIds"
    }
}

struct ProduceItem: Hashable, Codable {
    let id: String
    let condition: String?
    let minimumFriendship: Int
    let itemId: String
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case condition = "Condition"
        case minimumFriendship = "MinimumFriendship"
        case itemId = "ItemId"
    }
}

struct DeluxeProduceItem: Hashable, Codable {
    let id: String
    let condition: String?
    let minimumFriendship: Int
    let itemId: String
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case condition = "Condition"
        case minimumFriendship = "MinimumFriendship"
        case itemId = "ItemId"
    }
}

//  "RequiredBuilding": "Coop",
//  "UnlockCondition": null,
//  "EggItemIds": [
//    "176",
//    "174"
//  ],
//  "IncubationTime": -1,
//  "IncubatorParentSheetOffset": 1,
//  "ProduceItemIds": [
//    {
//      "Id": "Default",
//      "Condition": null,
//      "MinimumFriendship": 0,
//      "ItemId": "176"
//    }
//  ],
//  "DeluxeProduceItemIds": [
//    {
//      "Id": "Default",
//      "Condition": null,
//      "MinimumFriendship": 0,
//      "ItemId": "174"
//    }
//  ],
//  "ProduceOnMature": false,
