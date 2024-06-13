//
//  Bundle.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 7/8/22.
//

import Foundation

/**
 * Bundle information data
 *
 * @param id - a generated id to be used for list creation/navigation in the app
 * @param room_name - name of community center room it is present in
 * @param bundle_name - name of the bundle
 * @param reward - reward given for bundle completion
 * @param objects_needed - objects necessary to complete the bundle
 *
 * NOTE: Advanced information on the data obtained from this file can be found here: https://stardewvalleywiki.com/Modding:Bundles
 */
struct StandardBundle: Hashable, Codable {
    var roomName: String
    var bundleName: String
    var reward: Reward?
    var objectsNeeded: [BundleItem]
    enum CodingKeys: String, CodingKey {
        case roomName = "room_name"
        case bundleName = "bundle_name"
        case reward
        case objectsNeeded = "objects_needed"
    }
}

/**
 * Reward information data
 *
 * @param reward_type - object types are O Object, BO Big Object, F Furniture, H Hat, C Clothing or R Ring
 * @param reward_id - id of object being awarded
 * @param reward_count - amount of objects awarded for completion
 */
struct Reward: Hashable, Codable {
    var rewardType: String?
    var rewardId: String?
    var rewardCount: Int?
    enum CodingKeys: String, CodingKey {
        case rewardType = "reward_type"
        case rewardId = "reward_id"
        case rewardCount = "reward_count"
    }
}

/**
 * bundle item information data
 *
 * @param id - id of object needed for bundle
 * @param num_needed - number of objects needed for bundle
 * @param min_quality - quality required; Quality starts at 0 for no quality, up to 3 for iridium quality
 */
struct BundleItem: Hashable, Codable {
    var id: String
    var numNeeded: Int
    var minQuality: Int
    enum CodingKeys: String, CodingKey {
        case id
        case numNeeded = "num_needed"
        case minQuality = "min_quality"
    }
}
