//
//  Recipe+CoreDataProperties.swift
//  RecipeApp
//
//  Created by Qadriyyah Griffin on 10/20/20.
//
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }

    @NSManaged public var id: Int32
    @NSManaged public var userId: UUID?

}

extension Recipe : Identifiable {

}
