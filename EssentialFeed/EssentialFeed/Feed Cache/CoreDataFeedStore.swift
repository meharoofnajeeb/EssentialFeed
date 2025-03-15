//
//  CoreDataFeedStore.swift
//  EssentialFeed
//
//  Created by Meharoof Najeeb on 15/03/2025.
//  Copyright © 2025 Essential Developer. All rights reserved.
//

import Foundation

public class CoreDataFeedStore: FeedStore {
    public init() {}
    
    public func retrieve(completion: @escaping RetrievalCompletion) {
        completion(.empty)
    }
    
    public func insert(_ feed: [EssentialFeed.LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        
    }
    
    public func deleteCachedFeed(completion: @escaping DeletionCompletion) {
        
    }
    
}
