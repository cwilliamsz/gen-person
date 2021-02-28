//
//  Country.swift
//  GenPerson
//
//  Created by Charles on 09/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import UIKit

enum Country: Int, DetailProtocol {
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

    func title() -> String {
        return ""
    }

    func description() -> String {
        switch self {
        case .random:
            return String(identifier: StringIdentifier.commonRandomPt)
        case .brazil:
            return String(identifier: StringIdentifier.nationalityBRPt)
        case .unitedStates:
            return String(identifier: StringIdentifier.nationalityUSAPt)
        }
    }
}
