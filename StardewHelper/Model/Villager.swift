//
//  Villager.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/24/24.
//

import Foundation

struct Villager: Hashable, Codable {
    let displayName: String
    let birthSeason: String?
    let birthday: Int
    let region: String
    let romancable: Bool
    let canRecieveGifts: Bool
    enum CodingKeys: String, CodingKey {
        case displayName = "DisplayName"
        case birthSeason = "BirthSeason"
        case birthday = "BirthDay"
        case region = "HomeRegion"
        case romancable = "CanBeRomanced"
        case canRecieveGifts = "CanReceiveGifts"
    }
}
