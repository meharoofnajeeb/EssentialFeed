//
//  EssentialFeedCacheIntegrationTests.swift
//  EssentialFeedCacheIntegrationTests
//
//  Created by Meharoof Najeeb on 16/03/2025.
//  Copyright © 2025 Essential Developer. All rights reserved.
//

import XCTest
import EssentialFeed

final class EssentialFeedCacheIntegrationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        setupEmptyStoreState()
    }
    
    override func tearDown() {
        super.tearDown()
        
        undoStoreSideEffects()
    }
    
    func test_load_deliversNoItemsOnEmptyCache() {
        let sut = makeSUT()
        
        let exp = expectation(description: "Expected")
        sut.load { result in
            switch result {
            case .success(let feed):
                XCTAssertEqual(feed, [], "Expected retrieved feed to be empty, got \(feed) instead")
            case .failure(let error):
                XCTFail("Expected to complete successfully, got \(error) instead")
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1.0)
    }
    
    func test_load_deliversItemsSavedOnASeparateInstance() {
        let sutToPerformSave = makeSUT()
        let sutToPerformLoad = makeSUT()
        let feed = uniqueImageFeed().models
        
        let saveExp = expectation(description: "Wait for save completion")
        sutToPerformSave.save(feed) { saveError in
            XCTAssertNil(saveError, "Expected to save feed successfully")
            saveExp.fulfill()
        }
        wait(for: [saveExp], timeout: 1.0)
        
        let loadExp = expectation(description: "Wait for load completion")
        sutToPerformLoad.load { result in
            switch result {
            case .success(let retrievedFeed):
                XCTAssertEqual(retrievedFeed, feed)
            case .failure(let error):
                XCTFail("Expected successful feed result, got \(error) instead")
            }
            loadExp.fulfill()
        }
        wait(for: [loadExp], timeout: 1.0)
    }
    
    // MARK: Private methods
    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> LocalFeedLoader {
        let storeBundle = Bundle(for: CoreDataFeedStore.self)
        let storeURL = testSpecificStoreURL()
        let store = try! CoreDataFeedStore(storeURL: storeURL, bundle: storeBundle)
        let sut = LocalFeedLoader(store: store, currentDate: Date.init)
        trackForMemoryLeaks(store, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return sut
    }
    
    private func setupEmptyStoreState() {
        deleteStoreArtifacts()
    }
    
    private func undoStoreSideEffects() {
        deleteStoreArtifacts()
    }
    
    private func deleteStoreArtifacts() {
        try? FileManager.default.removeItem(at: testSpecificStoreURL())
    }
    
    private func testSpecificStoreURL() -> URL {
        return cachesDirectory().appendingPathComponent("\(type(of: self)).store")
    }
    
    private func cachesDirectory() -> URL {
        return FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
    }
}
