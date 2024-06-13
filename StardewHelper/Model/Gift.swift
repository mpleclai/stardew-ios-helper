//
//  Gift.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/24/24.
//

import Foundation

struct Gift: Hashable, Codable {
    let name: String
    let items: [String]?
    let love: [String]?
    let like: [String]?
    let dislike: [String]?
    let hate: [String]?
    let neutral: [String]?
}
