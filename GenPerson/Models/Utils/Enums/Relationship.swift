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
            case .English:
                return String(withCustomIdentifier: StringIdentifier.RelationshipMotherEng)
                
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.RelationshipMotherPt)
            }
            
        case .sister:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.RelationshipSisterEng)
                
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.RelationshipSisterPt)
            }
            
        case .daughter:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.RelationshipDaughterEng)
                
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.RelationshipDaughterPt)
            }
            
        case .father:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.RelationshipFatherEng)
                
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.RelationshipFatherPt)
            }
            
        case .brother:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.RelationshipBrotherEng)
                
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.RelationshipBrotherPt)
            }
            
        case .son:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.RelationshipSonEng)
                
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.RelationshipSonPt)
            }
            
        case .friend:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.RelationshipFriendEng)
                
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.RelationshipFriendPt)
            }
            
        case .spouse:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.RelationshipSpouseEng)
                
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.RelationshipSpousePt)
            }
            
        case .partner:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.RelationshipPartnerEng)
                
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.RelationshipPartnerPt)
            }
            
        case .parent:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.RelationshipParentEng)
                
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.RelationshipParentPt)
            }
            
        case .other:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.RelationshipOtherEng)
                
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.RelationshipOtherPt)
            }
        }
    }
    
}
