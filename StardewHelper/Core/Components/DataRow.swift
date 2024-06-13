//
//  DataRow.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/22/24.
//

import Foundation
import SwiftUI

struct DataRow: View {
    var label: String
    var value: String

    var body: some View {
        HStack {
            Text(label)
            Spacer()
            Text(value)
        }
    }
}

struct ObjectDataRow: View {
    var label: String
    var itemId: String
    var objectData: [String: GameObject]

    var body: some View {
        HStack {
            Text(label)
            Spacer()
            Text(
                LocalizedStringKey(getIdFromString(string: objectData[itemId]?.displayName ?? "Error")),
                tableName: "ObjectStrings"
            )
        }
    }
}
