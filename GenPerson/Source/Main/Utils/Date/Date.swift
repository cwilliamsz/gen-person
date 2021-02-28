//
//  Date.swift
//  GenPerson
//
//  Created by Charles on 10/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import UIKit

extension Date {
    var toString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = String(identifier: StringIdentifier.commonDateFormat)
        return dateFormatter.string(from: self)
    }

    func getAge() -> (Int, String, Bool) {
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: self, to: Date())
        let years = ageComponents.year ?? 0
        let months = ageComponents.month ?? 0
        let days = ageComponents.day ?? 0

        let isBaby = years == 0

        if years > 0 {
            return (years, String(identifier: StringIdentifier.personAgeYearPt), isBaby)
        } else if months > 0 {
            return (months, String(identifier: StringIdentifier.personAgeMonthPt), isBaby)
        } else {
            return (days, String(identifier: StringIdentifier.personAgeDayPt), isBaby)
        }
    }

    func changeYear(years: Int, increment: Bool) -> Date {
        return Calendar.current.date(byAdding: .year, value: increment ? years : -years, to: self) ?? self
    }
}
