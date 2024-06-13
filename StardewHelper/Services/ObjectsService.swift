//
//  NewObjectsService.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/24/24.
//

import Foundation

private let objectsDataSource = "Objects.json"

class ObjectsService {
    @Published var gameObjects: [String: GameObject] = [:]

    init() {
        getObjects()
    }

    private func getObjects() {
        gameObjects = load(objectsDataSource)
    }
}
