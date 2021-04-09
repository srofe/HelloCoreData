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
