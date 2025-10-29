//
//  FeedViewModel.swift
//  EssentialFeed
//
//  Created by Meharoof Najeeb on 2025-08-26.
//  Copyright © 2025 Essential Developer. All rights reserved.
//

import EssentialFeed

final class FeedViewModel {
    typealias Observer<T> = (T) -> Void
    private let feedLoader: FeedLoader
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    var onChangeLoadingState: Observer<Bool>?
    var onFeedLoad: Observer<[FeedImage]>?
    
    func loadFeed() {
        onChangeLoadingState?(true)
        feedLoader.load { [weak self] result in
            if let feed = try? result.get() {
                self?.onFeedLoad?(feed)
            }
            self?.onChangeLoadingState?(false)
        }
    }
}
