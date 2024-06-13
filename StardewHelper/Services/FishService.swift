//
//  FishService.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/22/24.
//

import Foundation

private let fishDataSource = "Fish.json"

class FishService {
    @Published var fish: [Fish] = []

    init() {
        getFish()
    }

    private func getFish() {
        fish = load(fishDataSource)
    }
}
