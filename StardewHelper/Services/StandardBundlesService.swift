//
//  StandardBundlesService.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/29/24.
//

import Foundation

private let standardBundlesDataSource = "StandardBundles.json"

class StandardBundlesService {
    @Published var standardBundleData: [StandardBundle] = []

    init() {
        getStandardBundleData()
    }

    private func getStandardBundleData() {
        standardBundleData = load(standardBundlesDataSource)
    }
}
