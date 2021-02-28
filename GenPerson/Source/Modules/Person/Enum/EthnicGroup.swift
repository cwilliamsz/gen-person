//
//  EthnicGroup.swift
//  GenPerson
//
//  Created by Charles on 10/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import Foundation

enum EthnicGroup: Int, DetailProtocol {
    case white  = 1
    case black  = 2
    case brown  = 3
    case red    = 4
    case yellow = 5

    func title() -> String {
        return ""
    }

    func description() -> String {
        switch self {
        case .white:
            return String(identifier: StringIdentifier.ethnicGroupWhitePt)
        case .black:
            return String(identifier: StringIdentifier.ethnicGroupBlackPt)
        case .brown:
            return String(identifier: StringIdentifier.ethnicGroupBrownPt)
        case .red:
            return String(identifier: StringIdentifier.ethnicGroupRedPt)
        case .yellow:
            return String(identifier: StringIdentifier.ethnicGroupYellowPt)
        }
    }
}
