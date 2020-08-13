//
//  Person.swift
//  GenPerson
//
//  Created by Charles on 09/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import Foundation
import RealmSwift

class Person: Object {
    @objc dynamic var id: Int                   = .idDefault
    @objc dynamic var sexOfBirth: Int           = .idDefault
    @objc dynamic var ethnicGroup: Int          = .idDefault
    @objc dynamic var country: Int              = .idDefault
    @objc dynamic var contactRelationship: Int  = .idDefault
    
    @objc dynamic var name: String              = ""
    @objc dynamic var phone: String             = ""
    @objc dynamic var email: String             = ""
    @objc dynamic var contactName: String       = ""
    @objc dynamic var contactPhone: String      = ""
    @objc dynamic var document: String          = ""
    
    @objc dynamic var dateOfBirth: Date         = Date()
    @objc dynamic var createdAt: Date           = Date()
}
