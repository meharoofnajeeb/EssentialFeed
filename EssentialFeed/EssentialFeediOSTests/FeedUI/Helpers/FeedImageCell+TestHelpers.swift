//
//  FeedImageCell+TestHelpers.swift
//  EssentialFeed
//
//  Created by Meharoof Najeeb on 2025-08-21.
//  Copyright © 2025 Essential Developer. All rights reserved.
//

import Foundation
import EssentialFeediOS

extension FeedImageCell {
    var isShowingLocation: Bool {
        return !locationContainer.isHidden
    }
    
    var isShowingImageLoadingIndicator: Bool {
        return feedImageContainer.isShimmering
    }
    
    var isShowingRetryButton: Bool {
        return !feedImageRetryButton.isHidden
    }
    
    var descriptionText: String? {
        return descriptionLabel.text
    }
    var locationText: String? {
        return locationLabel.text
    }
    
    var renderedImage: Data? {
        return feedImageView.image?.pngData()
    }
    
    func simulateRetryAction() {
        feedImageRetryButton.simulateTap()
    }
}
