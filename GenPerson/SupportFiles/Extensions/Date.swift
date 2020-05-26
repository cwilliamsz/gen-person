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
        dateFormatter.dateFormat = String(withCustomIdentifier: StringIdentifier.CommonDateFormat)
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
            switch Language.current {
            case .Portuguese:
                return (years, String(withCustomIdentifier: StringIdentifier.PersonAgeYearPt), isBaby)
            case .English:
                return (years, String(withCustomIdentifier: StringIdentifier.PersonAgeYearEng), isBaby)
            }
        }
        
        else if months > 0 {
            switch Language.current {
            case .Portuguese:
                return (months, String(withCustomIdentifier: StringIdentifier.PersonAgeMonthPt), isBaby)
            case .English:
                return (months, String(withCustomIdentifier: StringIdentifier.PersonAgeMonthEng), isBaby)
            }
        }
        
        else {
            switch Language.current {
            case .Portuguese:
                return (days, String(withCustomIdentifier: StringIdentifier.PersonAgeDayPt), isBaby)
            case .English:
                return (days, String(withCustomIdentifier: StringIdentifier.PersonAgeDayEng), isBaby)
            }
        }
    }
    
    func changeYear(years: Int, increment: Bool) -> Date {
        return Calendar.current.date(byAdding: .year, value: increment ? years : -years, to: self) ?? self
    }
    
}
