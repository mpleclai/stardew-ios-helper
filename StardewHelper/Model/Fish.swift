//
//  Fish.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/25/24.
//

import Foundation

struct Fish: Hashable, Codable, Identifiable {
    let id: String
    let name: String
    let type: String?
    let chanceToDart: Int?
    let dartingRandomness: String?
    let time: TimeRange?
    let weather: String?
    let fishingLevel: Int?
    let chance: Float?
    let location: String?
//    let isCaught: Bool?

    enum CodingKeys: String, CodingKey {
        case id, name, type, time, weather, chance, location
        case chanceToDart = "chance_to_dart"
        case dartingRandomness = "darting_randomness"
        case fishingLevel = "fishing_level"
//        case isCaught
    }

//    func updateCaughtStatus(caughtValue: Bool) -> Fish {
//        return Fish(id: id, name: name, type: type, chanceToDart: chanceToDart, dartingRandomness: dartingRandomness, time: time, weather: weather, fishingLevel: fishingLevel, chance: chance, location: location, isCaught: caughtValue)
//    }
}

struct TimeRange: Hashable, Codable {
    var minTime: Int?
    var maxTime: Int?

    enum CodingKeys: String, CodingKey {
        case minTime = "min_time"
        case maxTime = "max_time"
    }
}
