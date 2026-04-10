//
//  WeakRefVirtualProxy.swift
//  EssentialFeed
//
//  Created by Meharoof Najeeb on 2026-04-10.
//  Copyright © 2026 Essential Developer. All rights reserved.
//

import EssentialFeed
import UIKit

class WeakRefVirtualProxy<T: AnyObject> {
    private weak var object: T?
    
    init(_ object: T) {
        self.object = object
    }
}

extension WeakRefVirtualProxy: FeedLoadingView where T: FeedLoadingView {
    func display(_ viewModel: FeedLoadingViewModel) {
        object?.display(viewModel)
    }
}

extension WeakRefVirtualProxy: FeedImageView where T: FeedImageView, T.Image == UIImage {
    func display(_ model: FeedImageViewModel<UIImage>) {
        object?.display(model)
    }
}
