//
//  CheckboxToggle.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/22/24.
//

import Foundation
import SwiftUI

struct ToggleCheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            if configuration.isOn {
                Image(systemName: "checkmark.circle").foregroundColor(.secondary)
            } else {
                Image(systemName: "circle").foregroundColor(.secondary)
            }

        }
    }
}

extension ToggleStyle where Self == ToggleCheckboxStyle {
    static var checklist: ToggleCheckboxStyle {.init()}
}
