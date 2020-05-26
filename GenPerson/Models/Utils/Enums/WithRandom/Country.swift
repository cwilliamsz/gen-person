//
//  Country.swift
//  GenPerson
//
//  Created by Charles on 09/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import UIKit

enum Country: Int {
    
    case random = 0
    case br     = 1
    case usa    = 2
    
    static var key: String {
        return "nationality"
    }
    
    static var color: UIColor {
        return Color.nationality()
    }
    
    static var currentNationality: Country {
        return Country(rawValue: UserDefaultsUtils.current(key: self.key)) ?? .br
    }
        
    func nationality() -> String {
        switch self {
        case .random:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.CommonRandomEng)
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.CommonRandomPt)
            }
        case .br:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.NationalityBREng)
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.NationalityBRPt)
            }
        case .usa:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.NationalityUSAEng)
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.NationalityUSAPt)
            }
        }
    }
    
}
