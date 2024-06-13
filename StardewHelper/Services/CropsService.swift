//
//  CropsService.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/24/24.
//

import Foundation

private let cropsDataSource = "Crops.json"

class CropsDataService {
    @Published var crops: [String: Crop] = [:]

    init() {
        getCrops()
    }

    private func getCrops() {
        crops = load(cropsDataSource)
    }
}
