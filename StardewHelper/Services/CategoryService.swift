//
//  CategoryService.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/30/24.
//

import Foundation

private let categoryDataSource = "Categories.json"

class CategoryService {
    @Published var categories: [String: Category] = [:]

    init() {
        getCategories()
    }

    private func getCategories() {
        let array: [Category] = load(categoryDataSource)

        for item in array {
            categories.updateValue(item, forKey: item.id)
        }
    }
}
