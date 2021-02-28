//
//  Gender.swift
//  GenPerson
//
//  Created by Charles on 09/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import UIKit

enum Gender: Int, DetailProtocol {
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

    func title() -> String {
        return String(identifier: StringIdentifier.genderTitlePt)
    }

    func description() -> String {
        switch self {
        case .female:
            return String(identifier: StringIdentifier.genderFemalePt)
        case .masculine:
            return String(identifier: StringIdentifier.genderMasculinePt)
        case .random:
            return String(identifier: StringIdentifier.commonRandomPt)
        }
    }
}
