//
//  FishViewModel.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/22/24.
//

import Foundation
import Combine

class FishViewModel: ObservableObject {
    @Published var fish: [Fish] = []

    private let dataService = FishService()
    private var cancellables = Set<AnyCancellable>()

    init() {
       addSubscribers()
    }

    func addSubscribers() {
        dataService.$fish
            .sink { (returnedFish) in
                self.fish = returnedFish
            }.store(in: &cancellables)
    }
}
