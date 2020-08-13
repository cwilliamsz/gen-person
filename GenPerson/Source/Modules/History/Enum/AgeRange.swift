//
//  AgeRange.swift
//  GenPerson
//
//  Created by Charles on 18/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import UIKit

enum AgeRange: Int {
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

    func raw() -> String {
        switch self {
        case .random:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.CommonRandomEng)
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.CommonRandomPt)
            }
        case .older:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.AgeRangeOlderEng)
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.AgeRangeOlderPt)
            }
        case .minor:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.AgeRangeMinorEng)
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.AgeRangeMinorPt)
            }
        case .baby:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.AgeRangeBabyEng)
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.AgeRangeBabyPt)
            }
        case .child:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.AgeRangeChildEng)
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.AgeRangeChildPt)
            }
        case .teen:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.AgeRangeTeenEng)
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.AgeRangeTeenPt)
            }
        case .young:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.AgeRangeYoungEng)
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.AgeRangeYoungPt)
            }
        case .adult:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.AgeRangeAdultEng)
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.AgeRangeAdultPt)
            }
        case .elderly:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.AgeRangeElderlyEng)
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.AgeRangeElderlyPt)
            }
        }
    }
}
