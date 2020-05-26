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
            case .English:
                return String(withCustomIdentifier: StringIdentifier.EthnicGroupWhiteEng)
                
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.EthnicGroupWhitePt)
            }
            
        case .black:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.EthnicGroupBlackEng)
                
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.EthnicGroupBlackPt)
            }
            
        case .brown:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.EthnicGroupBrownEng)
                
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.EthnicGroupBrownPt)
            }
            
        case .red:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.EthnicGroupRedEng)
                
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.EthnicGroupRedPt)
            }
            
        case .yellow:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.EthnicGroupYellowEng)
                
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.EthnicGroupYellowPt)
            }
        }
    }
    
}
