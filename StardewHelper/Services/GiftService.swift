//
//  GiftService.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/24/24.
//

import Foundation

private let giftDataSource = "Gifts.json"

class GiftService {
    @Published var gifts: [Gift] = []

    init() {
        getGifts()
    }

    private func getGifts() {
        gifts = load(giftDataSource)
    }
}
