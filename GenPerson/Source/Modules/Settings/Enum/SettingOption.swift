//
//  SettingOption.swift
//  GenPerson
//
//  Created by Charles on 19/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import Foundation

enum SettingOption: Int, DetailProtocol {
    case gender         = 1
    case nationality    = 2
    case ageRange       = 3

    func title() -> String {
        switch self {
        case .gender:
            return String(identifier: StringIdentifier.genderTitlePt)
        case .nationality:
            return String(identifier: StringIdentifier.nationalityTitlePt)
        case .ageRange:
            return String(identifier: StringIdentifier.ageRangeTitlePt)
        }
    }
}
