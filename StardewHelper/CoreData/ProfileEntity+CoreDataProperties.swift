//
//  ProfileEntity+CoreDataProperties.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 4/3/24.
//
//

import Foundation
import CoreData

extension ProfileEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProfileEntity> {
        return NSFetchRequest<ProfileEntity>(entityName: "ProfileEntity")
    }

    @NSManaged public var color: String?
    @NSManaged public var id: UUID?
    @NSManaged public var isSelected: Bool
    @NSManaged public var name: String?
    @NSManaged public var dateDay: Int16
    @NSManaged public var dateYear: Int16
    @NSManaged public var dateSeason: String?
    @NSManaged public var museumCollection: String?
    @NSManaged public var fishCollection: String?
    @NSManaged public var standardBundles: String?
    @NSManaged public var remixedBundles: String?
}

extension ProfileEntity: Identifiable {

}
