//
//  CoreDataHelpers.swift
//  EssentialFeed
//
//  Created by Meharoof Najeeb on 16/03/2025.
//  Copyright © 2025 Essential Developer. All rights reserved.
//

import CoreData

extension NSPersistentContainer {
    static func load(modelName name: String, model: NSManagedObjectModel, url: URL) throws -> NSPersistentContainer {
        let storeDescription = NSPersistentStoreDescription(url: url)
        let container = NSPersistentContainer(name: name, managedObjectModel: model)
        container.persistentStoreDescriptions = [storeDescription]
        
        var loadError: Swift.Error?
        container.loadPersistentStores { loadError = $1 }
        try loadError.map { throw $0 }
        
        return container
    }
}

extension NSManagedObjectModel {
    static func with(name: String, in bundle: Bundle) -> NSManagedObjectModel? {
        return bundle
            .url(forResource: name, withExtension: "momd")
            .flatMap { NSManagedObjectModel(contentsOf: $0) }
    }
}
