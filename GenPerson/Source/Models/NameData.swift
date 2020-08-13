//
//  NameData.swift
//  GenPerson
//
//  Created by Charles on 10/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import Foundation

struct NameData: Codable {
    let id: Int
    let title: String
    let country: Int
    let gender: Int
    let isLastName: Bool
}
