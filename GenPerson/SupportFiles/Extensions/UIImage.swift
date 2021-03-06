//
//  UIImage.swift
//  GenPerson
//
//  Created by Charles on 07/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import UIKit

extension UIImage {
    
    public convenience init!(withImageIdentifier identifier: CustomIdentifier) {
        self.init(named: identifier.key)
    }
    
}
