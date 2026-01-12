//
//  UIControl+TestHelpers.swift
//  EssentialFeed
//
//  Created by Meharoof Najeeb on 2025-08-06.
//  Copyright © 2025 Essential Developer. All rights reserved.
//

import UIKit

extension UIControl {
    func simulate(event: UIControl.Event) {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: event)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
