//
//  Name.swift
//  GenPerson
//
//  Created by Charles on 09/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import Foundation
import RealmSwift

class Name: Object {
    @objc dynamic var id: Int           = .idDefault
    @objc dynamic var country: Int      = .idDefault
    @objc dynamic var gender: Int       = .idDefault
    @objc dynamic var title: String     = ""
    @objc dynamic var isLastName: Bool  = false
}
