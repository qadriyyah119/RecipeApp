//
//  UserProfile+CoreDataProperties.swift
//  RecipeApp
//
//  Created by Qadriyyah Griffin on 10/20/20.
//
//

import Foundation
import CoreData


extension UserProfile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserProfile> {
        return NSFetchRequest<UserProfile>(entityName: "UserProfile")
    }

    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var password: String?

}

extension UserProfile : Identifiable {

}
