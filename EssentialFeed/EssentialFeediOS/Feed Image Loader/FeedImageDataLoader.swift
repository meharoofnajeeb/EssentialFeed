//
//  FeedImageDataLoader.swift
//  EssentialFeed
//
//  Created by Meharoof Najeeb on 2025-08-04.
//  Copyright © 2025 Essential Developer. All rights reserved.
//

import Foundation

public protocol FeedImageDataTask {
    func cancel()
}

public protocol FeedImageDataLoader {
    typealias Result = Swift.Result<Data, Error>
    
    func loadImageData(from url: URL, completion: @escaping (Result) -> Void) -> FeedImageDataTask
}
