//
//  VillagerViewModel.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/24/24.
//

import Foundation
import Combine

class VillagerViewModel: ObservableObject {
    @Published var villagers: [String: Villager] = [:]
    @Published var gameObjects: [String: GameObject] = [:]
    @Published var gifts: [Gift] = []
    @Published var categories: [String: Category] = [:]

    private let objectsService = ObjectsService()
    private let categoryService = CategoryService()
    private let giftService = GiftService()
    private let villagerService = VillagersService()

    private var cancellables = Set<AnyCancellable>()

    init() {
        addSubscribers()
    }

    func addSubscribers() {
        villagerService.$villagers
            .sink { (returnedVillagers) in
                self.villagers = returnedVillagers
            }.store(in: &cancellables)
        objectsService.$gameObjects
            .sink {(returnedObjects) in
                self.gameObjects = returnedObjects
            }.store(in: &cancellables)
        giftService.$gifts
            .sink {(returnedGifts) in
                self.gifts = returnedGifts
            }.store(in: &cancellables)
        categoryService.$categories
            .sink {(returnedCategories) in
                self.categories = returnedCategories
            }.store(in: &cancellables)
    }
}
