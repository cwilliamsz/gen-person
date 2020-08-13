//
//  DbSetup.swift
//  GenPerson
//
//  Created by Charles on 09/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class DbSetup {
    func loadDB() {
        let realm = try! Realm()
        guard realm.objects(Name.self).isEmpty else {
            return
        }

        insertData()
    }

    private func insertData() {
        let data = Bundle.main.decode([NameData].self, from: "names.json")
        let realm = try! Realm()

        data.forEach { (item) in
            let name = Name()
            name.id = item.id
            name.title = item.title
            name.gender = item.gender
            name.country = item.country
            name.isLastName = item.isLastName

            try! realm.write {
                realm.add(name)
            }
        }
    }
}
