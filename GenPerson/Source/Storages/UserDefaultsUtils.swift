//
//  UserDefaultsUtils.swift
//  GenPerson
//
//  Created by Charles on 20/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import Foundation

struct UserDefaultsUtils {
    static func current(key: String) -> Int {
        return UserDefaults.standard.integer(forKey: key)
    }

    static func change(key: String, value: Int) {
        UserDefaults.standard.set(value, forKey: key)
    }
}
