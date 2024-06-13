//
//  RemixBundle.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/29/24.
//

import Foundation

struct RemixBundle: Hashable, Codable {
    let name: String?
    let items: String?
    let pick: Int?
    let requiredItems: Int?
    let reward: String?
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case items = "Items"
        case pick = "Pick"
        case requiredItems = "RequiredItems"
        case reward = "Reward"
    }
}

struct BundleSet: Hashable, Codable {
    let id: String
    let bundles: [RemixBundle]
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case bundles = "Bundles"
    }
}

struct BundleArea: Hashable, Codable {
    let areaName: String
    let bundleSets: [BundleSet]
    let bundles: [RemixBundle]
    enum CodingKeys: String, CodingKey {
        case areaName = "AreaName"
        case bundleSets = "BundleSets"
        case bundles = "Bundles"
    }
}

// {
//  "AreaName": "Crafts Room",
//  "Keys": "13 14 15 16 17 19",
//  "BundleSets": [
//    {
//      "Id": "Default",
//      "Bundles": [
//        {
//          "Name": "Spring Foraging",
//          "Index": 0,
//          "Sprite": "13",
//          "Color": "Green",
//          "Items": "1 Wild Horseradish, 1 Daffodil, 1 Leek, 1 Dandelion, 1 Spring Onion",
//          "Pick": 4,
//          "RequiredItems": -1,
//          "Reward": "30 Spring Seeds"
//        },
