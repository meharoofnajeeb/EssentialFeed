//
//  UIButton+TestHelpers.swift
//  EssentialFeed
//
//  Created by Meharoof Najeeb on 2025-08-06.
//  Copyright © 2025 Essential Developer. All rights reserved.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
