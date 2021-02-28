//
//  EthnicGroup.swift
//  GenPerson
//
//  Created by Charles on 10/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import Foundation

enum EthnicGroup: Int {
    case white  = 1
    case black  = 2
    case brown  = 3
    case red    = 4
    case yellow = 5

    func raw() -> String {
        switch self {
        case .white:
            switch Language.current {
            case .english:
                return String(identifier: StringIdentifier.ethnicGroupWhiteEng)

            case .portuguese:
                return String(identifier: StringIdentifier.ethnicGroupWhitePt)
            }

        case .black:
            switch Language.current {
            case .english:
                return String(identifier: StringIdentifier.ethnicGroupBlackEng)

            case .portuguese:
                return String(identifier: StringIdentifier.ethnicGroupBlackPt)
            }

        case .brown:
            switch Language.current {
            case .english:
                return String(identifier: StringIdentifier.ethnicGroupBrownEng)

            case .portuguese:
                return String(identifier: StringIdentifier.ethnicGroupBrownPt)
            }

        case .red:
            switch Language.current {
            case .english:
                return String(identifier: StringIdentifier.ethnicGroupRedEng)

            case .portuguese:
                return String(identifier: StringIdentifier.ethnicGroupRedPt)
            }

        case .yellow:
            switch Language.current {
            case .english:
                return String(identifier: StringIdentifier.ethnicGroupYellowEng)

            case .portuguese:
                return String(identifier: StringIdentifier.ethnicGroupYellowPt)
            }
        }
    }
}
