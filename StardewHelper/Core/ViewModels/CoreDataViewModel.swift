//
//  CoreDataViewModel.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 4/5/24.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var savedEntities: [ProfileEntity] = []
    @Published var selectedProfile: ProfileEntity?
    @Published var collectedMuseumItems: [String: GameObject] = [:]
    @Published var collectedStandardBundles: [String: [BundleItem]] = [:]
    @Published var collectedRemixedBundles: [String: [String]] = [:]
    @Published var collectedFish: [String: Fish] = [:]

    init() {
        container = NSPersistentContainer(name: "ProfileContainer")
        container.loadPersistentStores { _, error in
            if let error = error {
                print("error loading core data \(error)")
            }
        }
        fetchProfiles()
        fetchSelectedProfile()
        if(selectedProfile != nil){
            fetchMuseumCollection(profile: selectedProfile ?? ProfileEntity())
            fetchStandardBundlesCollection(profile: selectedProfile ?? ProfileEntity())
            fetchRemixedBundlesCollection(profile: selectedProfile ?? ProfileEntity())
            fetchFishCollection(profile: selectedProfile ?? ProfileEntity())
        }
    }

    func addProfile(name: String, color: String, date: ProfileDate) {
        let newProfile = ProfileEntity(context: container.viewContext)
        newProfile.id = UUID()
        newProfile.name = name
        newProfile.dateDay = Int16(date.day)
        newProfile.dateSeason = date.season
        newProfile.dateYear = Int16(date.year)
        newProfile.color = color
        newProfile.isSelected = false
        saveProfile()
    }

    func addProfile(name: String, day: Int, year: Int, season: String, color: String) {
        let newProfile = ProfileEntity(context: container.viewContext)
        newProfile.id = UUID()
        newProfile.name = name
        newProfile.dateDay = Int16(day)
        newProfile.dateSeason = season
        newProfile.dateYear = Int16(year)
        newProfile.color = color
        newProfile.isSelected = false
        saveProfile()
    }

    func updateProfile(profile: ProfileEntity?, name: String, color: String, date: ProfileDate, museumCollection: String) {
        if profile == nil {
            return
        }
        profile?.name = name
        profile?.dateDay = Int16(date.day)
        profile?.dateSeason = date.season
        profile?.dateYear = Int16(date.year)
        profile?.color = color
        saveProfile()
    }

    func updateProfile(profile: ProfileEntity?, name: String, day: Int, year: Int, season: String, color: String, museumCollection: String) {
        if profile == nil {
            return
        }
        profile?.name = name
        profile?.dateDay = Int16(day)
        profile?.dateSeason = season
        profile?.dateYear = Int16(year)
        profile?.color = color
        saveProfile()
    }

    func deleteProfile(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveProfile()
    }

    func saveProfile() {
        do {
            try container.viewContext.save()
            fetchProfiles()
        } catch let error {
            print("Error saving profile \(error)")
        }
    }

    func fetchProfiles() {
        let request = NSFetchRequest<ProfileEntity>(entityName: "ProfileEntity")
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("error fetching profiles \(error)")
        }
    }

    func fetchSelectedProfile() {
        for item in savedEntities {
            if item.isSelected == true {
                selectedProfile = item
            }
        }
    }

    func selectProfile(profile: ProfileEntity) {
        for item in savedEntities {
            if item.isSelected {
                item.isSelected = false
            }
        }
        profile.isSelected = true
        selectedProfile = profile
        saveProfile()
    }
    func updateMuseumCollection(profile: ProfileEntity, museumDict: [String: GameObject]) {
        profile.museumCollection = dictionaryToJson(dictionary: museumDict)
        saveProfile()
    }

    func fetchMuseumCollection(profile: ProfileEntity) {
        let newDict: [String: GameObject] = convertToDictionary(text: profile.museumCollection ?? "{}") ?? [:]
        collectedMuseumItems = newDict
        saveProfile()
    }
    
    func fetchStandardBundlesCollection(profile: ProfileEntity) {
        let newDict: [String: [BundleItem]] = convertToDictionary(text: profile.standardBundles ?? "{}") ?? [:]
        collectedStandardBundles = newDict
        saveProfile()
    }
    func updateStandardBundlesCollection(profile: ProfileEntity, bundles: [String : [BundleItem]]) {
        profile.standardBundles = bundleDictionaryToJson(dictionary: bundles)
        saveProfile()
    }
    
    func fetchRemixedBundlesCollection(profile: ProfileEntity) {
        let newDict: [String: [String]] = convertToDictionary(text: profile.remixedBundles ?? "{}") ?? [:]
        collectedRemixedBundles = newDict
        saveProfile()
    }
    func updateRemixedBundlesCollection(profile: ProfileEntity, bundles: [String : [String]]) {
        profile.remixedBundles = remixDictionaryToJson(dictionary: bundles)
        saveProfile()
    }

    func fetchFishCollection(profile: ProfileEntity){
        let newDict: [String: Fish] = convertToDictionary(text: profile.fishCollection ?? "{}") ?? [:]
        collectedFish = newDict
        saveProfile()
    }
    
    func updateFishCollection(profile: ProfileEntity, fishDict: [String : Fish]){
        profile.fishCollection = fishDictionaryToJson(dictionary: fishDict)
        saveProfile()
    }
}
