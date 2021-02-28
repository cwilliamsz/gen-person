//
//  Relationship.swift
//  GenPerson
//
//  Created by Charles on 10/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import Foundation

enum Relationship: Int, DetailProtocol {
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

    func title() -> String {
        return ""
    }

    func description() -> String {
        switch self {
        case .mother:
            return String(identifier: StringIdentifier.relationshipMotherPt)
        case .sister:
            return String(identifier: StringIdentifier.relationshipSisterPt)
        case .daughter:
            return String(identifier: StringIdentifier.relationshipDaughterPt)
        case .father:
            return String(identifier: StringIdentifier.relationshipFatherPt)
        case .brother:
            return String(identifier: StringIdentifier.relationshipBrotherPt)
        case .son:
            return String(identifier: StringIdentifier.relationshipSonPt)
        case .friend:
            return String(identifier: StringIdentifier.relationshipFriendPt)
        case .spouse:
            return String(identifier: StringIdentifier.relationshipSpousePt)
        case .partner:
            return String(identifier: StringIdentifier.relationshipPartnerPt)
        case .parent:
            return String(identifier: StringIdentifier.relationshipParentPt)
        case .other:
            return String(identifier: StringIdentifier.relationshipOtherPt)
        }
    }
}
