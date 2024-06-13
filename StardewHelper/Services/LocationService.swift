//
//  LocationService.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/25/24.
//

import Foundation

private let locationDataSource = "Locations.json"

class LocationsService {
    @Published var locations: [String: Location] = [:]

    init() {
        getLocations()
    }

    private func getLocations() {
        locations = load(locationDataSource)
    }
}
