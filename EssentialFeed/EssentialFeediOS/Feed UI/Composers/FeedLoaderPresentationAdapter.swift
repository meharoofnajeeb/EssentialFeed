//
//  FeedLoaderPresentationAdapter.swift
//  EssentialFeed
//
//  Created by Meharoof Najeeb on 2026-04-10.
//  Copyright © 2026 Essential Developer. All rights reserved.
//

import EssentialFeed

final class FeedLoaderPresenterAdapter: FeedViewControllerDelegate {
    private let feedLoader: FeedLoader
    var presenter: FeedPresenter?
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    func didRequestFeedRefresh() {
        presenter?.didStartLoadingFeed()
        
        feedLoader.load { [weak self] result in
            switch result {
            case let .success(feed):
                self?.presenter?.didFinishLoadingFeed(with: feed)
            case let .failure(error):
                self?.presenter?.didFinishLoadingFeed(with: error)
            }
        }
    }
}
