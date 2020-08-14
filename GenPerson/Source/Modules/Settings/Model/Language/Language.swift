//
//  Language.swift
//  GenPerson
//
//  Created by Charles on 07/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import UIKit

struct Language {
    static private let key = "language"

    static var color: UIColor {
        return Color.language()
    }

    static var current: LanguageType {
        guard let value = UserDefaults.standard.string(forKey: key), !value.isEmpty,
            let lang = LanguageType(rawValue: value) else {
            return LanguageType.portuguese
        }

        return lang
    }

    static func change(type: LanguageType) {
        UserDefaults.standard.set(type.rawValue, forKey: key)
    }
}
