//
//  SettingOption.swift
//  GenPerson
//
//  Created by Charles on 19/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import Foundation

enum SettingOption: Int {
    case gender         = 1
    case nationality    = 2
    case ageRange       = 3
    case idiom          = 4

    func raw() -> String {
        switch self {
        case .gender:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.GenderTitleEng)
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.GenderTitlePt)
            }

        case .nationality:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.NationalityTitleEng)
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.NationalityTitlePt)
            }

        case .ageRange:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.AgeRangeTitleEng)
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.AgeRangeTitlePt)
            }

        case .idiom:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.IdiomTitleEng)
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.IdiomTitlePt)
            }
        }
    }
}
