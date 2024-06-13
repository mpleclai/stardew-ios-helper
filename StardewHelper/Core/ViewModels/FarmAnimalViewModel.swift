//
//  FarmAnimalViewModel.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/24/24.
//

import Foundation
import Combine

class FarmAnimalViewModel: ObservableObject {
    @Published var farmAnimals: [String: FarmAnimal] = [:]
    @Published var gameObjects: [String: GameObject] = [:]

    private let farmAnimalService = FarmAnimalsDataService()
    private let objectsService = ObjectsService()

    private var cancellables = Set<AnyCancellable>()

    init() {
        addSubscribers()
    }

    func addSubscribers() {
        farmAnimalService.$farmAnimals
            .sink { (returnedAnimals) in
                self.farmAnimals = returnedAnimals
            }.store(in: &cancellables)
        objectsService.$gameObjects
            .sink {(returnedObjects) in
                self.gameObjects = returnedObjects
            }.store(in: &cancellables)
    }
}
