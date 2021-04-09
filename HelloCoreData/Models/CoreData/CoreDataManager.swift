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
}