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
            case .english:
                return String(identifier: StringIdentifier.genderFemaleEng)
            case .portuguese:
                return String(identifier: StringIdentifier.genderFemalePt)
            }

        case .masculine:
            switch Language.current {
            case .english:
                return String(identifier: StringIdentifier.genderMasculineEng)
            case .portuguese:
                return String(identifier: StringIdentifier.genderMasculinePt)
            }

        case .random:
            switch Language.current {
            case .english:
                return String(identifier: StringIdentifier.commonRandomEng)
            case .portuguese:
                return String(identifier: StringIdentifier.commonRandomPt)
            }
        }
    }
}
