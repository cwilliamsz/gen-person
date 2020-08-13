//
//  String+Identifier.swift
//  testBook
//
//  Created by Charles on 05/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import Foundation
import UIKit

extension String {
    public init(withCustomIdentifier identifier: CustomIdentifier) {
        self.init(NSLocalizedString(identifier.key, comment: ""))
    }

    public init(withCustomIdentifier identifier: CustomIdentifier, comment: String) {
        self.init(NSLocalizedString(identifier.key, comment: ""))
    }

    var toDate: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = String(withCustomIdentifier: StringIdentifier.CommonFormatToDate)
        return dateFormatter.date(from: self) ?? Date()
    }
}
