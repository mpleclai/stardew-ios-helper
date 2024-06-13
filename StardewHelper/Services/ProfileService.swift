//
//  ProfileService.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 3/30/24.
//

import Foundation
import CoreData

class ProfileService: ObservableObject {
    //    private let container: NSPersistentContainer(name: "ProfileContainer")
    //    private let containerName: String = "ProfileContainer"
    //    private let entityName: String = "ProfileEntity"

    //    @Published var savedProfiles: [ProfileEntity] = []

    init() {
//        container.loadPersistentStores { description, error in
//            if let error = error {
//                print("Core Data failed to load: \(error.localizedDescription)")
//            }
//        }
        //        container = NSPersistentContainer(name: containerName)
        //        container.loadPersistentStores { (_, error) in
        //            if let error = error {
        //                print("Error loading core data! \(error)")
        //            }
        //            self.getProfile()
        //        }
    }
}

//    // MARK: PUBLIC
//    public func updateProfile(profile: PlayerProfile, name: String) {
//        // check if profile is in the profile set
//        if let entity = savedProfiles.first(where: { $0.id == profile.id}) {
//            if entity.name != profile.name {
//                update(entity: entity, name: name)
//            }
//        } else {
//            add(profile: profile)
//        }
//    }
//    
//    public func deleteProfile(profile: PlayerProfile){
//        if let entity = savedProfiles.first(where: { $0.id == profile.id}) {
//            remove(entity: entity)
//        }
//    }
//
//    // MARK: PRIVATE
//    private func getProfile() {
//        let request = NSFetchRequest<ProfileEntity>(entityName: entityName)
//        do {
//            savedProfiles = try container.viewContext.fetch(request)
//        } catch let error {
//            print("error fetching profile entities. \(error)")
//        }
//    }
//
//    private func add(profile: PlayerProfile) {
//        let entity = ProfileEntity(context: container.viewContext)
//        entity.id = profile.id
//        entity.name = profile.name
//        applyChanges()
//    }
//
//    private func update(entity: ProfileEntity, name: String) {
//        entity.name = name
//        applyChanges()
//    }
//
//    private func remove(entity: ProfileEntity) {
//        container.viewContext.delete(entity)
//        applyChanges()
//    }
//
//    private func save() {
//        do {
//            try container.viewContext.save()
//        } catch let error {
//            print("Error saving to core data! \(error)")
//        }
//    }
//
//    private func applyChanges() {
//        save()
//        getProfile()
//    }
// }
