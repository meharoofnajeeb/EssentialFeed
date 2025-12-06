//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Meharoof Najeeb on 2025-08-27.
//  Copyright © 2025 Essential Developer. All rights reserved.
//

import Foundation
import EssentialFeed

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        return location != nil
    }
}
