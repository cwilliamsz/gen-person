//
//  Gender.swift
//  GenPerson
//
//  Created by Charles on 09/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import UIKit

enum Gender: Int {
    case random     = 0
    case female     = 1
    case masculine  = 2

    static var key: String {
        return "gender"
    }

    static var color: UIColor {
        return Color.gender()
    }

    static var current: Gender {
        return Gender(rawValue: UserDefaultsUtils.current(key: self.key)) ?? .random
    }

    func raw() -> String {
        switch self {
        case .female:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.GenderFemaleEng)
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.GenderFemalePt)
            }

        case .masculine:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.GenderMasculineEng)
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.GenderMasculinePt)
            }

        case .random:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.CommonRandomEng)
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.CommonRandomPt)
            }
        }
    }
}
