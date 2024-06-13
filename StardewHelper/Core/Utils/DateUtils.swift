//
//  DateUtils.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 4/3/24.
//

import Foundation

func handleDateIncrement(profile: ProfileEntity?, subtract: Bool) -> ProfileDate {
    let season = profile?.dateSeason ?? "Spring"
    let day: Int = Int(profile?.dateDay ?? 0)
    let year: Int = Int(profile?.dateYear ?? 0)

    var newSeason: String = season
    var newDay: Int = day
    var newYear: Int = year

    if subtract {
        if day == 1 {

            newDay = 28
            switch season {
                case "Spring":
                    newYear = year - 1
                    newSeason = "Winter"
                case "Summer": newSeason = "Spring"
                case "Fall": newSeason = "Summer"
                default: newSeason = "Fall"
            }
        } else {
            newDay -= 1
        }
    } else {
        if day == 28 {
            newDay = 1
            switch season {
                case "Spring": newSeason = "Summer"
                case "Summer": newSeason = "Fall"
                case "Fall": newSeason = "Winter"
                default:
                    newSeason = "Spring"
                    newYear = year + 1
            }
        } else {
            newDay += 1
        }
    }
    return ProfileDate(season: newSeason, day: newDay, year: newYear)
}

func dateToDayOfWeek(day: Int) -> String {
    return switch day % 7 {
    case 0: "Sunday"
    case 1: "Monday"
    case 2: "Tuesday"
    case 3: "Wednesday"
    case 4: "Thursday"
    case 5: "Friday"
    case 6: "Saturday"
    default: ""
    }
}

func getLastSeasonToPlant(crop: Crop) -> String {
    let seasons = crop.seasons
    if seasons.count == 1 {return seasons[0]}
    if seasons.contains("Fall") {
        return "Fall"
    } else if seasons.contains("Summer") {
        return "Summer"
    } else if seasons.contains("Spring") {
        return "Spring"
    }
    return ""
}

func getLastDayToPlant(crop: Crop) -> Int {
    let phaseDays = crop.daysInPhase
    var lastDay: Int = 28

    for num in phaseDays {
        lastDay -= num
    }
    lastDay -= 1
    return lastDay
}
