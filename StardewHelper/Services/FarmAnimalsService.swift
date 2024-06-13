//
//  FarmAnimalsService.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/24/24.
//

import Foundation

private let farmAnimalsDataSource = "FarmAnimals.json"

class FarmAnimalsDataService {
    @Published var farmAnimals: [String: FarmAnimal] = [:]

    init() {
        getFarmAnimals()
    }

    private func getFarmAnimals() {
        farmAnimals = load(farmAnimalsDataSource)
    }
}
