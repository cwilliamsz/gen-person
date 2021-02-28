//
//  AgeRange.swift
//  GenPerson
//
//  Created by Charles on 18/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import UIKit

enum AgeRange: Int, DetailProtocol {
    case random     = 1
    case older      = 2
    case minor      = 3
    case baby       = 4
    case child      = 5
    case teen       = 6
    case young      = 7
    case adult      = 8
    case elderly    = 9

    static var color: UIColor {
        return Color.ageRange()
    }

    func range() -> (Int, Int) {
        switch self {
        case .random:
            return (0, 100)
        case .older:
            return (18, 100)
        case .minor:
            return (0, 17)
        case .baby:
            return (0, 1)
        case .child:
            return (2, 12)
        case .teen:
            return (13, 19)
        case .young:
            return (15, 24)
        case .adult:
            return (18, 65)
        case .elderly:
            return (65, 100)
        }
    }

    static var key: String {
        return "age_range"
    }

    static var current: AgeRange {
        return AgeRange(rawValue: UserDefaultsUtils.current(key: self.key)) ?? .random
    }

    func title() -> String {
        return ""
    }

    func description() -> String {
        switch self {
        case .random:
            return String(identifier: StringIdentifier.commonRandomPt)
        case .older:
            return String(identifier: StringIdentifier.ageRangeOlderPt)
        case .minor:
            return String(identifier: StringIdentifier.ageRangeMinorPt)
        case .baby:
            return String(identifier: StringIdentifier.ageRangeBabyPt)
        case .child:
            return String(identifier: StringIdentifier.ageRangeChildPt)
        case .teen:
            return String(identifier: StringIdentifier.ageRangeTeenPt)
        case .young:
            return String(identifier: StringIdentifier.ageRangeYoungPt)
        case .adult:
            return String(identifier: StringIdentifier.ageRangeAdultPt)
        case .elderly:
            return String(identifier: StringIdentifier.ageRangeElderlyPt)
        }
    }
}
