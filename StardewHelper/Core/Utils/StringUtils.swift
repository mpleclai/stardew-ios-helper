//
//  StringUtils.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/28/24.
//

import Foundation

extension String {
    func trimmingAllSpaces(using characterSet: CharacterSet = .whitespacesAndNewlines) -> String {
          return components(separatedBy: characterSet).joined()
      }
}

func getIdFromString(string: String) -> String {
    if string.contains("Error") {
        return string
    } else {
        let split1 = string.components(separatedBy: ":")
        let split2 = split1[1].components(separatedBy: "]")
        return split2[0]
    }
}

func getLocalizedIdFromName(string: String) -> String {
    return string.trimmingAllSpaces() + "_Name"
}

func formStringFromEntityDate(profile: ProfileEntity) -> String {
    return (profile.dateSeason ?? "Spring") + " " + String(profile.dateDay)  + " Year " + String(profile.dateYear)
}
