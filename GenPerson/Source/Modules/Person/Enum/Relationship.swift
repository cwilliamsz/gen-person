//
//  Relationship.swift
//  GenPerson
//
//  Created by Charles on 10/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import Foundation

enum Relationship: Int {
    case mother     = 1
    case sister     = 2
    case daughter   = 3

    case father     = 4
    case brother    = 5
    case son        = 6

    case friend     = 7
    case spouse     = 8
    case partner    = 9
    case parent     = 10
    case other      = 11

    func raw() -> String {
        switch self {
        case .mother:
            switch Language.current {
            case .english:
                return String(identifier: StringIdentifier.relationshipMotherEng)

            case .portuguese:
                return String(identifier: StringIdentifier.relationshipMotherPt)
            }

        case .sister:
            switch Language.current {
            case .english:
                return String(identifier: StringIdentifier.relationshipSisterEng)

            case .portuguese:
                return String(identifier: StringIdentifier.relationshipSisterPt)
            }

        case .daughter:
            switch Language.current {
            case .english:
                return String(identifier: StringIdentifier.relationshipDaughterEng)

            case .portuguese:
                return String(identifier: StringIdentifier.relationshipDaughterPt)
            }

        case .father:
            switch Language.current {
            case .english:
                return String(identifier: StringIdentifier.relationshipFatherEng)

            case .portuguese:
                return String(identifier: StringIdentifier.relationshipFatherPt)
            }

        case .brother:
            switch Language.current {
            case .english:
                return String(identifier: StringIdentifier.relationshipBrotherEng)

            case .portuguese:
                return String(identifier: StringIdentifier.relationshipBrotherPt)
            }

        case .son:
            switch Language.current {
            case .english:
                return String(identifier: StringIdentifier.relationshipSonEng)

            case .portuguese:
                return String(identifier: StringIdentifier.relationshipSonPt)
            }

        case .friend:
            switch Language.current {
            case .english:
                return String(identifier: StringIdentifier.relationshipFriendEng)

            case .portuguese:
                return String(identifier: StringIdentifier.relationshipFriendPt)
            }

        case .spouse:
            switch Language.current {
            case .english:
                return String(identifier: StringIdentifier.relationshipSpouseEng)

            case .portuguese:
                return String(identifier: StringIdentifier.relationshipSpousePt)
            }

        case .partner:
            switch Language.current {
            case .english:
                return String(identifier: StringIdentifier.relationshipPartnerEng)

            case .portuguese:
                return String(identifier: StringIdentifier.relationshipPartnerPt)
            }

        case .parent:
            switch Language.current {
            case .english:
                return String(identifier: StringIdentifier.relationshipParentEng)

            case .portuguese:
                return String(identifier: StringIdentifier.relationshipParentPt)
            }

        case .other:
            switch Language.current {
            case .english:
                return String(identifier: StringIdentifier.relationshipOtherEng)

            case .portuguese:
                return String(identifier: StringIdentifier.relationshipOtherPt)
            }
        }
    }
}
