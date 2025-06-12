//
//  FeedViewControllerTests.swift
//  EssentialFeediOSTests
//
//  Created by Meharoof Najeeb on 12/06/2025.
//  Copyright © 2025 Essential Developer. All rights reserved.
//

import XCTest

final class FeedViewController: UIViewController {
    private var loader: FeedViewControllerTests.LoaderSpy?
    convenience init(loader: FeedViewControllerTests.LoaderSpy) {
        self.init()
        self.loader = loader
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loader?.load()
    }
}

final class FeedViewControllerTests: XCTestCase {
    
    func test_init_doesNotLoadFeed() {
        let loader = LoaderSpy()
        let _ = FeedViewController(loader: loader)
        
        XCTAssertEqual(loader.loadFeedCallCount, 0)
    }
    
    func test_viewDidLoad_loadsFeed() {
        let loader = LoaderSpy()
        let sut = FeedViewController(loader: loader)
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(loader.loadFeedCallCount, 1)
    }
    
    // MARK: Helpers
    
    class LoaderSpy {
        private(set) var loadFeedCallCount: Int = 0
        
        func load() {
            loadFeedCallCount += 1
        }
    }
}

