//
//  UITableView+Dequeueing.swift
//  EssentialFeed
//
//  Created by Meharoof Najeeb on 2026-01-11.
//  Copyright © 2026 Essential Developer. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
