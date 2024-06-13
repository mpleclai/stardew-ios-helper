//
//  FarmAnimalDetailView.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 12/15/23.
//

import SwiftUI

struct FarmAnimalDetailView: View {
    @EnvironmentObject private var farmAnimalVM: FarmAnimalViewModel
    var farmAnimalKey: String

    let defaultFarmAnimal = FarmAnimal(displayName: "", building: nil, purchasePrice: 0, sellPrice: 0, daysToMature: 0, daysToProduce: 0, harvestType: "", harvestTool: nil, produceItem: [], deluxeProduceItem: [])

    var body: some View {
        let farmAnimal: FarmAnimal = farmAnimalVM.farmAnimals[farmAnimalKey] ?? defaultFarmAnimal
        let objectData = farmAnimalVM.gameObjects

        VStack(alignment: HorizontalAlignment.leading) {
            HStack(alignment: VerticalAlignment.center) {
                Text(farmAnimalKey).font(.title).padding([.leading, .trailing], 16)
            }
            List {
                if farmAnimal.purchasePrice != -1 {
                    DataRow(label: "Purchase Price: ", value: "$" + String(farmAnimal.purchasePrice))
                }
                DataRow(label: "Sell Price: ", value: "$" + String(farmAnimal.sellPrice))
                let matureString = if farmAnimal.daysToMature == 0 {
                    "Does not mature"
                } else {
                    "Matures after " + String(farmAnimal.daysToMature) + " days"
                }
                DataRow(label: "Growth: ", value: matureString)

                if !farmAnimal.produceItem.isEmpty {
                    ObjectDataRow(label: "Produce: ", itemId: farmAnimal.produceItem.first?.itemId ?? "Error", objectData: objectData)
                }
                if !farmAnimal.deluxeProduceItem.isEmpty {
                    ObjectDataRow(label: "Deluxe Produce: ", itemId: farmAnimal.deluxeProduceItem.first?.itemId ?? "Error", objectData: objectData)
                }
                DataRow(label: "Production Rate: ", value: "Every " + String(farmAnimal.daysToProduce) + " days")
                DataRow(label: "Building: ", value: farmAnimal.building ?? "N/A")
                DataRow(label: "Harvest Tool", value: farmAnimal.harvestTool ?? "None")
                DataRow(label: "Harvest Type", value: farmAnimal.harvestType)
            }
        }
    }
}
