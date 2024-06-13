//
//  RemixBundlesService.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/29/24.
//

import Foundation

private let bundlesDataSource = "RandomBundles.json"

class RemixBundlesService {
    @Published var remixBundleData: [BundleArea] = []

    init() {
        getBundleData()
    }

    private func getBundleData() {
        remixBundleData = load(bundlesDataSource)
    }
}
