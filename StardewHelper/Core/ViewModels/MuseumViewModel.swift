//
//  MuseumViewModel.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 4/5/24.
//

import Foundation
import Combine

class MuseumViewModel: ObservableObject {
    @Published var gameObjects: [String: GameObject] = [:]
    @Published var categories: [String: Category] = [:]

    private let objectsService = ObjectsService()
    private let categoryService = CategoryService()

    private var cancellables = Set<AnyCancellable>()

    init() {
        addSubscribers()
    }

    func addSubscribers() {
        objectsService.$gameObjects
            .sink {(returnedObjects) in
                self.gameObjects = returnedObjects
            }.store(in: &cancellables)
        categoryService.$categories
            .sink {(returnedCategories) in
                self.categories = returnedCategories
            }.store(in: &cancellables)
    }
}
