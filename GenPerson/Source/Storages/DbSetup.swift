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
    private var connection: Realm {
        do {
            let realm = try Realm()
            return realm
        } catch {
            fatalError("DbSetup fail to load realm \(error.localizedDescription)")
        }
    }

    func loadDB() {
        guard connection.objects(Name.self).isEmpty else {
            return
        }

        insertData()
    }

    private func insertData() {
        let data = Bundle.main.decode([NameData].self, from: "names.json")
        data.forEach { (item) in
            let name = Name()
            name.id = item.id
            name.title = item.title
            name.gender = item.gender
            name.country = item.country
            name.isLastName = item.isLastName

            do {
                try connection.write {
                    connection.add(name)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
