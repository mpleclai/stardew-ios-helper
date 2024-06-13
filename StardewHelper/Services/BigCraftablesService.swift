//
//  BigCraftablesService.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/24/24.
//

import Foundation

private let bigCraftablesDataSource = "BigCraftables.json"

class BigCraftablesService {
    @Published var bigCraftables: [String: BigCraftable] = [:]

    init() {
        getBigCraftables()
    }

    private func getBigCraftables() {
        bigCraftables = load(bigCraftablesDataSource)
    }
}
