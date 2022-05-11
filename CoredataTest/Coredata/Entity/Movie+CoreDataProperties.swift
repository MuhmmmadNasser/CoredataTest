//
//  Movie+CoreDataProperties.swift
//  CoredataTest
//
//  Created by Mohamed on 10/05/2022.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var image: String?
    @NSManaged public var rating: Double
    @NSManaged public var releaseYear: Int32
    @NSManaged public var title: String?

}

extension Movie : Identifiable {

}
