//
//  BigCraftable.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/24/24.
//

import Foundation

struct BigCraftable: Hashable, Codable {
    let name: String
    let displayName: String
    let description: String
    let price: Int

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case displayName = "DisplayName"
        case description = "Description"
        case price = "Price"
    }
}
