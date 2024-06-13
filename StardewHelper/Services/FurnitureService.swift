//
//  FurnitureService.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/25/24.
//

import Foundation

private let furnitureDataSource = "Furniture.json"

class FurnitureService {
    @Published var furniture: [String: Furniture] = [:]

    init() {
        getFurniture()
    }

    private func getFurniture() {
        let furnitureArray: [Furniture] = load(furnitureDataSource)

        for item in furnitureArray {
            furniture.updateValue(item, forKey: item.id)
        }
    }
}
