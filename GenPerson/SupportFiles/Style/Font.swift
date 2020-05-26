//
//  Font.swift
//  GenPerson
//
//  Created by Charles on 21/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import UIKit

struct Font {
    
    // MARK: - Label
    static func labelTitle() -> UIFont {
        return UIFont.systemFont(ofSize: 15, weight: .medium)
    }
    
    static func labelDetail() -> UIFont {
        return UIFont.systemFont(ofSize: 15, weight: .regular)
    }
    
    static func labelTag() -> UIFont {
        return UIFont.systemFont(ofSize: 14, weight: .semibold)
    }
    
    static func labelSubTag() -> UIFont {
        return UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    // MARK: - TextField
    static func textFieldText() -> UIFont {
        return UIFont.systemFont(ofSize: 18, weight: .regular)
    }
    
    // MARK: - Button
    static func buttonGenerate() -> UIFont {
        return UIFont.systemFont(ofSize: 18, weight: .semibold)
    }
    
    static func buttonFilter() -> UIFont {
        return UIFont.systemFont(ofSize: 18, weight: .regular)
    }
        
}
