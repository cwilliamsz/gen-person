//
//  UIViewController+LoadNib.swift
//  GenPerson
//
//  Created by Charles on 04/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import UIKit

// MARK: - LoadNib
extension UIViewController {
    class func fromNib<T: UIViewController>(owner: Any?) -> T? {
        return Bundle.main.loadNibNamed(String(describing: self), owner: owner, options: nil)?.first as? T
    }
}
