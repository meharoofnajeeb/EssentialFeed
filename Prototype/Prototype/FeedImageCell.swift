//
//  FeedImageCell.swift
//  Prototype
//
//  Created by Meharoof Najeeb on 23/03/2025.
//

import UIKit

class FeedImageCell: UITableViewCell {
    @IBOutlet weak var locationContainer: UIView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        feedImageView.alpha = 0
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        feedImageView.alpha = 0
    }
    
    func fadeIn(_ image: UIImage?) {
        feedImageView.image = image
        
        UIView.animate(
            withDuration: 0.3,
            delay: 0.3,
            options: [],
            animations: {
                self.feedImageView.alpha = 1
        })
        
    }
}
