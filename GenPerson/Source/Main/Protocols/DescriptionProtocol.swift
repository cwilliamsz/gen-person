//
//  DescriptionProtocol.swift
//  GenPerson
//
//  Created by Charles William on 15/08/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import Foundation

protocol DetailProtocol {
    func title() -> String
    func description() -> String
}

extension DetailProtocol {
    func description() -> String {
        return ""
    }
}
