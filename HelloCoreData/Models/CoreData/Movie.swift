//
//  Movie.swift
//  HelloCoreData
//
//  Created by Simon Rofe on 9/4/21.
//

import CoreData

@objc(Movie)
class Movie: NSManagedObject {
    @NSManaged public var name: String
}

extension Movie {
    @nonobjc class var fetchRequest: NSFetchRequest<Movie> {
        NSFetchRequest<Movie>(entityName: "Movie")
    }
}
