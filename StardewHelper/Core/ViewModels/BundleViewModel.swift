//
//  BundleViewModel.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/29/24.
//

import Foundation
import Combine

class BundleViewModel: ObservableObject {
    @Published var remixBundleData: [BundleArea] = []
    @Published var standardBundleData: [StandardBundle] = []
    @Published var gameObjects: [String: GameObject] = [:]
    @Published var bigCraftables: [String: BigCraftable] = [:]

    private let remixBundlesService = RemixBundlesService()
    private let standardBundlesService = StandardBundlesService()
    private let objectsService = ObjectsService()
    private let bigCraftableService = BigCraftablesService()

    private var cancellables = Set<AnyCancellable>()

    init() {
        addSubscribers()
    }

    func addSubscribers() {
        remixBundlesService.$remixBundleData
            .sink { (returnedBundleData) in
                self.remixBundleData = returnedBundleData
            }.store(in: &cancellables)
        standardBundlesService.$standardBundleData
            .sink { (returnedStandardBundleData) in
                self.standardBundleData = returnedStandardBundleData
            }.store(in: &cancellables)
        objectsService.$gameObjects
            .sink {(returnedObjects) in
                self.gameObjects = returnedObjects
            }.store(in: &cancellables)
        bigCraftableService.$bigCraftables
            .sink {(returnedCraftables) in
                self.bigCraftables = returnedCraftables
            }.store(in: &cancellables)
    }
}
