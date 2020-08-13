//
//  UITableView+Identifier.swift
//  GenPerson
//
//  Created by Charles on 14/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import UIKit

extension UITableView {
    public func registerNib(_ nib: UINib?, forCellReuseIdentifier identifier: CustomIdentifier) {
        return register(nib, forCellReuseIdentifier: identifier.key)
    }

    public func dequeueReusableCellWithIdentifier(_ identifier: CustomIdentifier, forIndexPath: IndexPath) -> UITableViewCell {
        return dequeueReusableCell(withIdentifier: identifier.key, for: forIndexPath)
    }
}
