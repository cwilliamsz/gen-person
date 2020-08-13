//
//  UICollectionView+Identifier.swift
//  GenPerson
//
//  Created by Charles on 24/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import UIKit

extension UICollectionView {
    public func dequeueReusableCellWithReuseIdentifier(_ identifier: String, forIndexPath: IndexPath) -> UICollectionViewCell {
        return dequeueReusableCell(withReuseIdentifier: identifier, for: forIndexPath)
    }

    public func registerNib(_ nib: UINib?, forCellWithReuseIdentifier identifier: String) {
        return register(nib, forCellWithReuseIdentifier: identifier)
    }
}
