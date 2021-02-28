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
    case brazil = 1
    case unitedStates = 2

    static var key: String {
        return "nationality"
    }

    static var color: UIColor {
        return Color.nationality()
    }

    static var currentNationality: Country {
        return Country(rawValue: UserDefaultsUtils.current(key: self.key)) ?? .brazil
    }

    func nationality() -> String {
        switch self {
        case .random:
            switch Language.current {
            case .english:
                return String(identifier: StringIdentifier.commonRandomEng)
            case .portuguese:
                return String(identifier: StringIdentifier.commonRandomPt)
            }
        case .brazil:
            switch Language.current {
            case .english:
                return String(identifier: StringIdentifier.nationalityBREng)
            case .portuguese:
                return String(identifier: StringIdentifier.nationalityBRPt)
            }
        case .unitedStates:
            switch Language.current {
            case .english:
                return String(identifier: StringIdentifier.nationalityUSAEng)
            case .portuguese:
                return String(identifier: StringIdentifier.nationalityUSAPt)
            }
        }
    }
}
