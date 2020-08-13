//
//  LanguageType.swift
//  GenPerson
//
//  Created by Charles on 07/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import Foundation

enum LanguageType: String {
    case English = "ENG"
    case Portuguese = "PT-BR"

    func raw() -> String {
        switch self {
        case .Portuguese:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.IdiomPortugueseEng)
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.IdiomPortuguesePt)
            }

        case .English:
            switch Language.current {
            case .English:
                return String(withCustomIdentifier: StringIdentifier.IdiomEnglishEng)
            case .Portuguese:
                return String(withCustomIdentifier: StringIdentifier.IdiomEnglishPt)
            }
        }
    }
}
