//
//  CropDetailView.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 7/8/22.
//

import SwiftUI

struct CropDetailView: View {
    @EnvironmentObject private var cropVM: CropViewModel
    var cropKey: String

    let defaultCrop = Crop(seasons: [""], daysInPhase: [1], regrowDays: 1, isRaised: false, isPaddyCrop: false, needsWatering: false, harvestMethod: "", harvestItemId: "", harvestMinStack: 1, harvestMaxStack: 1)

    var body: some View {
        let objectData = cropVM.gameObjects
        let crop: Crop = cropVM.crops[cropKey] ?? defaultCrop

        VStack {
            HStack(alignment: VerticalAlignment.center) {
                Text(
                    LocalizedStringKey(getIdFromString(string: objectData[cropKey]?.displayName ?? "Error")),
                    tableName: "ObjectStrings"
                ).font(.title).padding([.leading, .trailing], 16)
            }
            List {
                ObjectDataRow(label: "Harvest Item", itemId: crop.harvestItemId, objectData: objectData)
                DataRow(label: "Seasons", value: crop.seasons.joined(separator: ", "))
                DataRow(label: "Days In Phase", value: crop.daysInPhase.description)
                DataRow(label: "Regrow Days", value: getRegrowthValue(regrows: crop.regrowDays))
                DataRow(label: "Is Raised", value: String(crop.isRaised))
                DataRow(label: "Is Paddy Crop", value: String(crop.isPaddyCrop))
                DataRow(label: "Needs Watering", value: String(crop.needsWatering))
                DataRow(label: "harvestMinStack", value: String(crop.harvestMinStack))
                DataRow(label: "harvestMaxStack", value: String(crop.harvestMaxStack))
                DataRow(label: "Harvest Method", value: crop.harvestMethod)
            }
        }
    }
}

private func getRegrowthValue(regrows: Int) -> String {
    return switch regrows {
        case -1: String("Does not regrow")
        default: "Regrows in " + String(regrows) + " days"
    }
}
