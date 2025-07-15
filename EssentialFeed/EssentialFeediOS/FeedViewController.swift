//
//  FeedViewController.swift
//  EssentialFeed
//
//  Created by Meharoof Najeeb on 15/07/2025.
//  Copyright © 2025 Essential Developer. All rights reserved.
//

import UIKit
import EssentialFeed

public final class FeedViewController: UITableViewController {
    private var onViewIsAppearing: (() -> Void)?
    private var loader: FeedLoader?
    public convenience init(loader: FeedLoader) {
        self.init()
        self.loader = loader
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        onViewIsAppearing = {
            self.refresh()
            self.onViewIsAppearing = nil
        }
    }
    
    public override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        
        onViewIsAppearing?()
    }
    
    @objc private func refresh() {
        refreshControl?.beginRefreshing()
        loader?.load { [weak self] _ in
            self?.refreshControl?.endRefreshing()
        }
    }
}
