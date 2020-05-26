//
//  Color.swift
//  GenPerson
//
//  Created by Charles on 21/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import UIKit

struct Color {
    
    static func mainColor() -> UIColor {
        return UIColor(rgbWithRed: 105, green: 54, blue: 245, alpha: 1)
    }
    
    static func mainColorBackground() -> UIColor {
        return UIColor(rgbWithRed: 229, green: 223, blue: 247, alpha: 1)
    }
    
    // MARK: - View
    static func mainBackground() -> UIColor {
        return UIColor(rgbWithRed: 246, green: 246, blue: 246, alpha: 1)
    }
    
    static func subBackground() -> UIColor {
        return UIColor.clear
    }
    
    static func viewBackground() -> UIColor {
        return UIColor.white
    }
    
    // MARK: - Label
    static func labelTitleText() -> UIColor {
        return UIColor.gray.withAlphaComponent(0.8)
    }
    
    static func labelDetailText() -> UIColor {
        return UIColor.gray.withAlphaComponent(0.8)
    }
    
    // MARK: - TextField
    static func textFieldBackground() -> UIColor {
        return UIColor.white
    }
    
    static func textFieldBorder() -> UIColor {
        return UIColor(rgbWithRed: 230, green: 230, blue: 230, alpha: 1)
    }
    
    static func textFieldText() -> UIColor {
        return UIColor.black
    }
    
    // MARK: - Icon Copy
    static func iconCopyDefault() -> UIColor {
        return UIColor.gray
    }
    
    static func iconCopySelected() -> UIColor {
        return UIColor(rgbWithRed: 105, green: 54, blue: 245, alpha: 1)
    }
    
    // MARK: - Button
    static func buttonGenerateTitle() -> UIColor {
        return UIColor.white
    }
    
    // MARK: - TableView
    static func tableViewBackground() -> UIColor {
        return UIColor(rgbWithRed: 246, green: 246, blue: 246, alpha: 1)
    }
    
    // MARK: - Enum
    static func gender() -> UIColor {
        return UIColor(rgbWithRed: 255, green: 120, blue: 75, alpha: 1)
    }
    
    static func nationality() -> UIColor {
        return UIColor(rgbWithRed: 255, green: 200, blue: 55, alpha: 1)
    }
    
    static func ageRange() -> UIColor {
        return UIColor(rgbWithRed: 60, green: 210, blue: 120, alpha: 1)
    }
    
    static func language() -> UIColor {
        return UIColor(rgbWithRed: 210, green: 80, blue: 230, alpha: 1)
    }
    
    // MARK: - Gender
    static func female() -> UIColor {
        return UIColor(rgbWithRed: 255, green: 85, blue: 95, alpha: 1)
    }
    
    static func masculine() -> UIColor {
        return UIColor(rgbWithRed: 79, green: 114, blue: 154, alpha: 1)
    }
    
}
