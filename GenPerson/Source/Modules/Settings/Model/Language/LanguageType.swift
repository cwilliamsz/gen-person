//
//  LanguageType.swift
//  GenPerson
//
//  Created by Charles on 07/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import Foundation

enum LanguageType: String {
    case english = "ENG"
    case portuguese = "PT-BR"

    func raw() -> String {
        switch self {
        case .portuguese:
            switch Language.current {
            case .english:
                return String(identifier: StringIdentifier.idiomPortugueseEng)
            case .portuguese:
                return String(identifier: StringIdentifier.idiomPortuguesePt)
            }

        case .english:
            switch Language.current {
            case .english:
                return String(identifier: StringIdentifier.idiomEnglishEng)
            case .portuguese:
                return String(identifier: StringIdentifier.idiomEnglishPt)
            }
        }
    }
}
