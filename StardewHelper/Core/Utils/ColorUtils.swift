//
//  ColorUtils.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/30/24.
//

import Foundation
import SwiftUI

extension Color {
    static var random: Color {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        return Color(red: red, green: green, blue: blue)
    }

    static var randomBlue: Color {
        let red = Double.random(in: 0...0.3)
        let green = Double.random(in: 0...0.5)
        let blue = Double.random(in: 0.5...1)
        return Color(red: red, green: green, blue: blue)
    }
}

func colorStringToColor(colorString: String) -> Color {
    return switch colorString {
        case "Pink": .pink
        case "Red": .red
        case "Orange": .orange
        case "Yellow": .yellow
        case "Green": .green
        case "Blue": .blue
        case "Purple": .purple
        default: .gray
    }
}
