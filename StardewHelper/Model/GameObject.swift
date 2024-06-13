//
//  GameObject.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/24/24.
//

import Foundation

struct GameObject: Hashable, Codable {
    let name: String
    let displayName: String
    let description: String
    let type: String
    let category: Int
    let price: Int
    let excludeFromFishingCollection: Bool
    let excludeFromShippingCollection: Bool
    let excludeFromRandomSale: Bool

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case displayName = "DisplayName"
        case description = "Description"
        case type = "Type"
        case category = "Category"
        case price = "Price"
        case excludeFromFishingCollection = "ExcludeFromFishingCollection"
        case excludeFromShippingCollection = "ExcludeFromShippingCollection"
        case excludeFromRandomSale = "ExcludeFromRandomSale"
    }
}
