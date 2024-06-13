//
//  CropViewModel.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/24/24.
//

import Foundation
import Combine

class CropViewModel: ObservableObject {
    @Published var crops: [String: Crop] = [:]
    @Published var gameObjects: [String: GameObject] = [:]

    private let cropsService = CropsDataService()
    private let objectsService = ObjectsService()

    private var cancellables = Set<AnyCancellable>()

    init() {
        addSubscribers()
    }

    func addSubscribers() {
        cropsService.$crops
            .sink { (returnedCrops) in
                self.crops = returnedCrops
            }.store(in: &cancellables)
        objectsService.$gameObjects
            .sink {(returnedObjects) in
                self.gameObjects = returnedObjects
            }.store(in: &cancellables)
    }
}
