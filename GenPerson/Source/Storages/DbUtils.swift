//
//  DbUtils.swift
//  GenPerson
//
//  Created by Charles on 09/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import Foundation
import RealmSwift

open class DbUtils {
    private var nationalityWithoutRandom: Country!

    private var connection: Realm {
        do {
            let realm = try Realm()
            return realm
        } catch {
            fatalError("DbUtils fail to load realm \(error.localizedDescription)")
        }
    }

}

// MARK: - Person  Methods
extension DbUtils {
    func setNationality(country: Country) {
        self.nationalityWithoutRandom = country
    }

    func getName(gender: Int) -> Name? {
        let predicate = NSPredicate(format: "isLastName == false AND gender == \(gender)")
        let results = findName(withPredicate: predicate)
        guard results.isEmpty else {
            return getName(gender: gender)
        }

        let idx = Int.random(in: 0 ..< results.count)
        return results[idx]
    }

    func getLastName() -> Name? {
        let predicate = NSPredicate(format: "isLastName == true")
        let results = findName(withPredicate: predicate)
        guard results.isEmpty else {
            return getLastName()
        }

        let idx = Int.random(in: 0 ..< results.count)
        return results[idx]
    }

    func savePerson(_ item: Person) {
        let lastId: Int = connection.objects(Person.self).max(ofProperty: "id") ?? 0

        try! connection.write {
            item.setValue(lastId + 1, forKey: "id")
            connection.add(item)
        }
    }

    private func findName(withPredicate predicate: NSPredicate) -> Results<Name> {
        return connection.objects(Name.self)
            .filter(predicate)
            .filter("country == \(nationalityWithoutRandom.rawValue)")
    }
}

// MARK: - History  Methods
extension DbUtils {
    func getAllPerson(byKeyPath: String = "createdAt",
                      ascending: Bool = false,
                      gender: Gender,
                      nationality: Country,
                      ageRange: AgeRange) -> Results<Person>? {
        let genders         = gender == .random ? [1, 2] : [gender.rawValue]
        let nationalities   = nationality == .random ? [1, 2] : [nationality.rawValue]

        let range       = ageRange.range()
        let startDate   = Date().changeYear(years: range.0, increment: false)
        let endDate     = Date().changeYear(years: range.1, increment: false)

        return connection.objects(Person.self)
            .filter("country IN %@", nationalities)
            .filter("sexOfBirth IN %@", genders)
            .filter("%@ >= dateOfBirth AND %@ <= dateOfBirth", startDate, endDate)
            .sorted(byKeyPath: byKeyPath, ascending: ascending)
    }

    func searchPerson(_ text: String,
                      gender: Gender,
                      nationality: Country,
                      ageRange: AgeRange) -> Results<Person>? {
        let results = getAllPerson(gender: gender, nationality: nationality, ageRange: ageRange)
        return results?.filter("name contains[cd] '\(text)'")
    }
}
