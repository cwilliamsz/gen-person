//
//  UIColor.swift
//  testBook
//
//  Created by Charles on 01/05/19.
//  Copyright © 2019 Charles. All rights reserved.
//

import UIKit

extension UIColor {
    
    public convenience init(rgbWithRed red: Int, green: Int, blue: Int, alpha: CGFloat) {
        self.init(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: alpha)
    }
    
}

