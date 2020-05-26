//
//  SettingsViewModel.swift
//  GenPerson
//
//  Created by Charles on 19/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import UIKit

class SettingsViewModel {
    
    private var items: [[Any]] = []
    
    var numberOfSections: Int {
        return items.count
    }
    
    func numberOfItems(_ section: Int) -> Int {
        guard items.count > section else { return items.count }
        return items[section].count
    }
    
    func heightForHeaderInSection(_ isAction: Bool) -> CGFloat {
        return isAction ? 40 : 0
    }

    func load(items: [[Any]]) {
        self.items = items
    }

    func getItem(indexPath: IndexPath) -> SettingOption? {
        guard let filterItem = items[indexPath.section][indexPath.row] as? SettingOption else { return nil }
        return filterItem
    }
    
    func getTitle(indexPath: IndexPath) -> String {
        let value = items[indexPath.section][indexPath.row]
        switch value {
        case is Gender:
            return (value as! Gender).raw()
        case is Country:
            return (value as! Country).nationality()
        case is AgeRange:
            return (value as! AgeRange).raw()
        case is SettingOption:
            return (value as! SettingOption).raw()
        case is LanguageType:
            return (value as! LanguageType).raw()
        default:
            return String()
        }
    }
    
    func getDetail(indexPath: IndexPath) -> String {
        let value = items[indexPath.section][indexPath.row]
        
        switch value {
        case is SettingOption:
            guard let item = value as? SettingOption else { return String() }
            switch item {
            case .gender:
                return Gender.current.raw()
            case .nationality:
                return Country.currentNationality.nationality()
            case .ageRange:
                return AgeRange.current.raw()
            case .idiom:
                return Language.current.raw()
            }
            
        case is AgeRange:
            guard let range = (value as? AgeRange)?.range() else { return String() }
            return "\(range.0)-\(range.1)"
            
        default:
            return String()
        }
    }
    
    func isSelected(indexPath: IndexPath) -> Bool {
        let value = items[indexPath.section][indexPath.row]
        
        switch value {
        case is Gender:
            return (value as! Gender) == Gender.current
        case is Country:
            return (value as! Country) == Country.currentNationality
        case is AgeRange:
            return (value as! AgeRange) == AgeRange.current
        case is LanguageType:
            return (value as! LanguageType) == Language.current
        default:
            return false
        }
    }
    
    func saveSelected(indexPath: IndexPath) {
        let value = items[indexPath.section][indexPath.row]
        
        switch value {
        case is Gender:
            UserDefaultsUtils.change(key: Gender.key, value: (value as! Gender).rawValue)
        case is Country:
            UserDefaultsUtils.change(key: Country.key, value: (value as! Country).rawValue)
        case is AgeRange:
            UserDefaultsUtils.change(key: AgeRange.key, value: (value as! AgeRange).rawValue)
        case is LanguageType:
            changeLanguage(language: value as! LanguageType)
        default:
            break
        }
    }
    
    private func changeLanguage(language: LanguageType) {
        switch language {
        case .English:
            Language.change(to: .English)

        case .Portuguese:
            Language.change(to: .Portuguese)
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationIdentifier.ChangeLanguage.rawValue), object: nil)
    }
    
    func getItemsForDetail(indexPath: IndexPath) -> [[Any]] {
        let value = items[indexPath.section][indexPath.row]
        guard let filterItem = value as? SettingOption else { return [] }
        
        switch filterItem {
        case .gender:
            let values: [[Gender]] = [[.random, .female, .masculine]]
            return values
        case .nationality:
            let values: [[Country]] = [[.random, .br, .usa]]
            return values
        case .ageRange:
            let values: [[AgeRange]] = [[.random, .minor, .older, .baby, .child, .teen, .young, .adult, .elderly]]
            return values
        case .idiom:
            let values: [[LanguageType]] = [[.Portuguese, .English]]
            return values
        }
    }
    
    private func checkItemExist(indexPath: IndexPath, array: [[Any]]) -> Bool {
        guard array.count > indexPath.section, array[indexPath.section].count > indexPath.row else {
            return false
        }
        
        return true
    }
    
}
