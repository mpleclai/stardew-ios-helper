//
//  CharactersService.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/24/24.
//

import Foundation

private let villagersDataSource = "Characters.json"

class VillagersService {
    @Published var villagers: [String: Villager] = [:]

    init() {
        getVillagers()
    }

    private func getVillagers() {
        villagers = load(villagersDataSource)
    }
}
