//
//  SelectedProfile+CoreDataProperties.swift
//  StardewHelper
//
//  Created by Madeline LeClair on 4/7/24.
//
//

import Foundation
import CoreData

extension SelectedProfile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SelectedProfile> {
        return NSFetchRequest<SelectedProfile>(entityName: "SelectedProfile")
    }

    @NSManaged public var id: UUID?

}

extension SelectedProfile: Identifiable {

}
