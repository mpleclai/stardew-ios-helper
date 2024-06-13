//
//  LocationViewModel.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/25/24.
//

import Foundation
import Combine

class LocationViewModel: ObservableObject {
    @Published var locations: [String: Location] = [:]
    @Published var gameObjects: [String: GameObject] = [:]
    @Published var furniture: [String: Furniture] = [:]
    @Published var fish: [Fish] = []

    private let locationsService = LocationsService()
    private let furnitureService = FurnitureService()
    private let objectsService = ObjectsService()
    private let fishService = FishService()

    private var cancellables = Set<AnyCancellable>()

    init() {
        addSubscribers()
    }

    func addSubscribers() {
        locationsService.$locations
            .sink { (returnedLocations) in
                self.locations = returnedLocations
            }.store(in: &cancellables)
        objectsService.$gameObjects
            .sink {(returnedObjects) in
                self.gameObjects = returnedObjects
            }.store(in: &cancellables)
        fishService.$fish
            .sink { (returnedFish) in
                self.fish = returnedFish
            }.store(in: &cancellables)
        furnitureService.$furniture
            .sink { (returnedFurniture) in
                self.furniture = returnedFurniture
            }.store(in: &cancellables)
    }
}
