//
//  CoreDataManager.swift
//  HelloCoreData
//
//  Created by Simon Rofe on 9/4/21.
//

import CoreData

fileprivate let persistentStoreName = "Model"

struct CoreDataManager {
    static var inMemory: CoreDataManager = {
        let coreDataManager = CoreDataManager(inMemory: true)
        return coreDataManager
    }()
    public var context: NSManagedObjectContext {
        container.viewContext
    }
    private let container: NSPersistentContainer

    private init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: persistentStoreName)
        if inMemory {
            let description = NSPersistentStoreDescription()
            description.type = NSInMemoryStoreType
            container.persistentStoreDescriptions = [description]
        }
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store failed to load: \(error.localizedDescription)")
            }
        }
    }

    var movies: [Movie] {
        do {
            let movies = try container.viewContext.fetch(Movie.fetchRequest)
            return movies
        } catch {
            return []
        }
    }

    func save(name: String) {
        let movie = Movie(context: container.viewContext)
        movie.name = name
        do {
            try container.viewContext.save()
        } catch {
            fatalError("Core Data Store failed to save movie: \(error.localizedDescription)")
        }
    }

    func delete(movie: Movie) {
        container.viewContext.delete(movie)
        do {
            try container.viewContext.save()
        } catch {
            container.viewContext.rollback()
            fatalError("Core Data Store failed to save context during delete: \(error.localizedDescription)")
        }
    }

    func updateMovie() {
        do {
            try container.viewContext.save()
        } catch {
            container.viewContext.rollback()
            fatalError("Core Data Store failed to save context during update: \(error.localizedDescription)")
        }
    }
}
