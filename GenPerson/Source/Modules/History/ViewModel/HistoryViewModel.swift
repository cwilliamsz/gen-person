//
//  HistoryViewModel.swift
//  GenPerson
//
//  Created by Charles on 17/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift
import os.log

class HistoryViewModel {

    private var results: Results<Person>?
    private let dbUtils =  DbUtils()

    private var _filterSelected: SettingOption      = .ageRange
    private var _genderSelected: Gender             = .random
    private var _nationalitySelected: Country       = .random
    private var _ageRangeSelected: AgeRange         = .random

    private let _genders: [Gender]                  = [.random, .female, .masculine]
    private let _nationalities: [Country]           = [.random, .brazil, .unitedStates]
    private let _sectionsFilter: [SettingOption]    = [.ageRange, .gender, .nationality]
    private let _ageRanges: [AgeRange]              = [.random, .older, .minor, .baby, .child,
                                                       .teen, .young, .adult, .elderly]

    private var _searchText     = String()

    func reloadData() {
        loadData()
    }

    private func loadData() {
        results = dbUtils.getAllPerson(gender: _genderSelected,
                                       nationality: _nationalitySelected,
                                       ageRange: _ageRangeSelected)
    }
}

// MARK: TableView
extension HistoryViewModel {
    var heightForRow: CGFloat {
        return 60
    }

    var numberOfItems: Int {
        return results?.count ?? 0
    }

    func item(for row: Int) -> Person? {
        guard let results = self.results, results.count > row else {
            return nil
        }

        return results[row]
    }
}

// MARK: Search
extension HistoryViewModel {
    var searchText: String {
        return _searchText
    }

    var searchIsActive: Bool {
        return !_searchText.isEmpty
    }

    func search(text: String, reload: @escaping () -> Void) {
        _searchText = text
        results = dbUtils.searchPerson(text,
                                       gender: _genderSelected,
                                       nationality: _nationalitySelected,
                                       ageRange: _ageRangeSelected)
        reload()
    }

    func cancelSearch() {
        _searchText = String()
    }
}

// MARK: Filter
extension HistoryViewModel {
    var filterSelected: SettingOption {
        return _filterSelected
    }

    func selectFilter(selected: SettingOption) {
        _filterSelected = selected
    }

    func optionSelected(_ settingOption: SettingOption? = nil) -> DetailProtocol? {
        let value = settingOption != nil ? settingOption : _filterSelected
        switch value {
        case .ageRange:
            return _ageRangeSelected
        case .gender:
            return _genderSelected
        case .nationality:
            return _nationalitySelected
        case .none:
            return value
        }
    }

    func setOption(item: Any) {
        switch item {
        case is Gender:
            _genderSelected = item as! Gender
        case is Country:
            _nationalitySelected = item as! Country
        case is AgeRange:
            _ageRangeSelected = item as! AgeRange
        default:
            break
        }
    }

    func numberOfFiltersActive() -> Int {
        let ageRange    = _ageRangeSelected == .random ? 0 : 1
        let gender      = _genderSelected == .random ? 0 : 1
        let country     = _nationalitySelected == .random ? 0 : 1
        return ageRange + gender + country
    }
}

// MARK: CollectionView Filter
extension HistoryViewModel {
    func numberOfItemsInSection(tag: Int) -> Int {
        guard tag != 1 else {
            return _sectionsFilter.count
        }

        switch _filterSelected {
        case .ageRange:
            return _ageRanges.count
        case .gender:
            return _genders.count
        case .nationality:
            return _nationalities.count
        }
    }

    func itemForCell(row: Int, tag: Int = 0) -> Any? {
        guard tag != 1 else {
            return _sectionsFilter[row]
        }

        switch _filterSelected {
        case .ageRange:
            return _ageRanges[row]
        case .gender:
            return _genders[row]
        case .nationality:
            return _nationalities[row]
        }
    }
}
