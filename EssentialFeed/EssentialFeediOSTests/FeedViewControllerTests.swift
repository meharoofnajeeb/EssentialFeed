//
//  FeedViewControllerTests.swift
//  EssentialFeediOSTests
//
//  Created by Meharoof Najeeb on 12/06/2025.
//  Copyright © 2025 Essential Developer. All rights reserved.
//

import XCTest

final class FeedViewController {
    init(loader: FeedViewControllerTests.LoaderSpy) {
        
    }
}

final class FeedViewControllerTests: XCTestCase {
    
    func test_init_doesNotLoadFeed() {
        let loader = LoaderSpy()
        let _ = FeedViewController(loader: loader)
        
        XCTAssertEqual(loader.loadFeedCallCount, 0)
    }
    
    // MARK: Helpers
    
    class LoaderSpy {
        private(set) var loadFeedCallCount = 0
    }
}

