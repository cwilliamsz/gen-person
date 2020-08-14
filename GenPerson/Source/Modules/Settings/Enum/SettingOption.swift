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
            case .english:
                return String(identifier: StringIdentifier.genderTitleEng)
            case .portuguese:
                return String(identifier: StringIdentifier.genderTitlePt)
            }

        case .nationality:
            switch Language.current {
            case .english:
                return String(identifier: StringIdentifier.nationalityTitleEng)
            case .portuguese:
                return String(identifier: StringIdentifier.nationalityTitlePt)
            }

        case .ageRange:
            switch Language.current {
            case .english:
                return String(identifier: StringIdentifier.ageRangeTitleEng)
            case .portuguese:
                return String(identifier: StringIdentifier.ageRangeTitlePt)
            }

        case .idiom:
            switch Language.current {
            case .english:
                return String(identifier: StringIdentifier.idiomTitleEng)
            case .portuguese:
                return String(identifier: StringIdentifier.idiomTitlePt)
            }
        }
    }
}
