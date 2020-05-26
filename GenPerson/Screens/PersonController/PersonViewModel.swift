//
//  PersonViewModel.swift
//  GenPerson
//
//  Created by Charles on 10/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import Foundation
import RealmSwift

class PersonViewModel {

    private let dbUtils =  DbUtils()
    private var lastLastName = String()
    
    var largeName: Bool = true
    var nationalityWithoutRandom: Country = .br
    
    init() {
    }
    
    func getPerson() -> Person {
        switch Country.currentNationality {
        case .random:
            let value = Int.random(in: 1 ..< 3)
            nationalityWithoutRandom = Country(rawValue: value)!
        default:
            nationalityWithoutRandom = Country.currentNationality
        }
        
        dbUtils.setNationality(country: nationalityWithoutRandom)
        
        let person = Person()
        let gender = randomGender()
        let genderContact = randomGender()
        let nameInfo = createName(gender: gender)
        
        person.name = nameInfo.0
        person.document = createCPFValid()
        person.dateOfBirth = createDate()
        person.sexOfBirth = gender.rawValue
        person.ethnicGroup = randomEthnicGroup()
        person.country = nameInfo.1
        person.contactName = createName(gender: genderContact, isContactName: true).0
        person.contactRelationship = randomRealtionship(genderOfContact: genderContact.rawValue)
        person.email = createEmail(name: person.name)
        person.phone = createPhone()
        person.contactPhone = createPhone()
        
        dbUtils.savePerson(person)
        return person
    }
    
    func getAge(_ person: Person) -> String {
        let ageInfo = person.dateOfBirth.getAge()
        return String(format: ageInfo.1, ageInfo.0)
    }
    
    private func createName(gender: Gender, isContactName: Bool = false) -> (String, Int) {
        guard let nameInfo = dbUtils.getName(gender: gender.rawValue) else {
            return ("", 0)
        }
        
        var name = nameInfo.title
        let country = nameInfo.country
        
        var secondName = dbUtils.getName(gender: gender.rawValue)?.title ?? ""
        while name.contains(secondName) {
            secondName = dbUtils.getName(gender: gender.rawValue)?.title ?? ""
        }
        
        name+=" \(secondName)"
        
        if largeName {
            var thirdName = dbUtils.getName(gender: gender.rawValue)?.title ?? ""
            while name.contains(thirdName) {
                thirdName = dbUtils.getName(gender: gender.rawValue)?.title ?? ""
            }
            
            name+=" \(thirdName)"
        }
        
        guard !isContactName else {
            name+=" \(lastLastName)"
            return ("\(name.localizedCapitalized)", country)
        }
        
        // LastName
        let firstLastName = dbUtils.getLastName()?.title ?? ""
        var secondLastName = dbUtils.getLastName()?.title ?? ""
        while firstLastName.contains(secondLastName) {
            secondLastName = dbUtils.getLastName()?.title ?? ""
        }
        
        lastLastName = "\(firstLastName) \(secondLastName)"
        name+=" \(lastLastName)"
                
        return (name.localizedCapitalized, country)
    }
    
    private func randomGender() -> Gender {
        guard Gender.current == .random else {
            return Gender.current
        }
        
        return Gender(rawValue: Int.random(in: 1 ..< 3))!
    }
    
    private func randomEthnicGroup() -> Int {
        return Int.random(in: 1 ..< 5)
    }
    
    private func randomRealtionship(genderOfContact: Int) -> Int {
        let isOther = Int.random(in: 1 ..< 2) == 1 ? true : false
        
        // Female
        if genderOfContact == 1 {
            return isOther ? Int.random(in: 1 ..< 3) : Int.random(in: 7 ..< 11)
        } else {
            return isOther ? Int.random(in: 4 ..< 6) : Int.random(in: 7 ..< 11)
        }
    }
    
    private func createCPFValid() -> String {
        guard nationalityWithoutRandom == .br else {
            return String()
        }
        
        var cpf = [0,0,0,0,0,0,0,0,0,0,0]
        var temp1 = 0,temp2 = 0
        
        for i in 0...8 {
            cpf[i] = (Int)(arc4random_uniform(9))
            temp1 += cpf[i] * (10 - i)
            temp2 += cpf[i] * (11 - i)
        }
        
        temp1 %= 11
        cpf[9] = temp1 < 2 ? 0 : 11-temp1
        
        temp2 += cpf[9] * 2
        temp2 %= 11
        cpf[10] = temp2 < 2 ? 0 : 11-temp2
        
        return "\(cpf[0])\(cpf[1])\(cpf[2]).\(cpf[3])\(cpf[4])\(cpf[5]).\(cpf[6])\(cpf[7])\(cpf[8])-\(cpf[9])\(cpf[10])"
    }
    
    private func createDate() -> Date {
        let calendar = Calendar.current
        let currentYear = calendar.component(.year, from: Date())
        var randomYear = Int.random(in: (currentYear - 100) ..< currentYear)
        let randomMonth = Int.random(in: 1 ..< 12)
        
        switch AgeRange.current {
        case .random:
            randomYear = Int.random(in: (currentYear - 99) ..< currentYear)

        case .older:
            randomYear = Int.random(in: (currentYear - 17) ..< currentYear)

        case .minor:
            randomYear = Int.random(in: (currentYear - 16) ..< currentYear)

        case .baby:
            randomYear = Int.random(in: (currentYear - 1) ..< currentYear)

        case .child:
            randomYear = Int.random(in: (currentYear - 12) ..< (currentYear - 2))

        case .teen:
            randomYear = Int.random(in: (currentYear - 19) ..< (currentYear - 13))

        case .young:
            randomYear = Int.random(in: (currentYear - 24) ..< (currentYear - 15))

        case .adult:
            randomYear = Int.random(in: (currentYear - 65) ..< (currentYear - 18))

        case .elderly:
            randomYear = Int.random(in: (currentYear - 100) ..< (currentYear - 65))
        }
        
        var randomDay = 1
        switch randomMonth {
        case 1,3,5,7,8,10,12:
            randomDay = Int.random(in: 1 ..< 31)
        case 2:
            randomDay = Int.random(in: 1 ..< 28)
        default:
            randomDay = Int.random(in: 1 ..< 30)
        }
        
        return "\(randomYear)-\(randomMonth)-\(randomDay)".toDate
    }
    
    private func createEmail(name: String) -> String {
        let separators = [".", "-", "_"]
        let domain = getDomain()

        let prefix = String(name.prefix(4)).trimmingCharacters(in: .whitespaces)
        let suffix = String(name.suffix(3)).trimmingCharacters(in: .whitespaces)
                
        guard let separator = separators.randomElement() else {
            return "\(prefix).\(suffix)@\(domain)".lowercased()
        }
        
        let firstPart = "\(prefix)\(separator)\(suffix)".folding(options: .diacriticInsensitive, locale: .current)
        let secondPart = "\(firstPart.lowercased())\(separator)"
        
        return "\(secondPart)@\(domain)"
    }
    
    private func getDomain() -> String {
        let domains = ["outlook.com",
                       "icloud.com",
                       "gmail.com",
                       "live.com",
                       "yahoo.com"
                      ]
        
        guard let domain = domains.randomElement() else {
            return "test.com"
        }
        
        return domain
    }
    
    private func createPhone() -> String {
        var prefix = String()
        var areaCodes = [Int]()
        var phone = ""
        var phoneSize = 0
        
        switch nationalityWithoutRandom {
        case .br:
            prefix = String(withCustomIdentifier: StringIdentifier.PhonePrefixPt)
            areaCodes = [38,41,42,43,44,45,46,47,48,49,51,53,54,
                         55,61,62,63,64,65,66,67,68,69,71,73,74,
                         75,77,79,81,82,83,84,85,86,87,88,89,91,
                         92,93,94,95,96,97,98,99]
            
            phone = "99"
            phoneSize = 9
            
        case .usa:
            prefix = String(withCustomIdentifier: StringIdentifier.PhonePrefixEng)
            areaCodes = [209,213,310,323,408,415,510,530,559,
                         562,619,626,650,661,707,714,760,805,
                         818,831,858,909,916,925,949]
            phone = "7"
            phoneSize = 7
            
        default:
            break
        }
        
        
        while phone.count < phoneSize {
            let random = Int.random(in: 0 ..< 9)
            phone+="\(random)"
        }
        
        phone.insert("-", at: phone.index(phone.startIndex, offsetBy: 5))
        
        guard let areaCode = areaCodes.randomElement() else {
            return "\(prefix) \(00) \(phone)"
        }
        
        return "\(prefix) \(areaCode) \(phone)"
    }

}
