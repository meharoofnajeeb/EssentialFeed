//
//  UIImageView+Animations.swift
//  EssentialFeed
//
//  Created by Meharoof Najeeb on 2026-01-11.
//  Copyright © 2026 Essential Developer. All rights reserved.
//

import UIKit

extension UIImageView {
    func setImageAnimated(_ newImage: UIImage?) {
        image = newImage
        
        guard newImage != nil else { return }
        
        alpha = 0
        UIView.animate(withDuration: 0.25) {
            self.alpha = 1
        }
    }
}
