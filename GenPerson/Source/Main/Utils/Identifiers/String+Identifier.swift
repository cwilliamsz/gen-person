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
    public init(identifier: CustomIdentifier) {
        self.init(NSLocalizedString(identifier.key, comment: ""))
    }

    public init(identifier: CustomIdentifier, comment: String) {
        self.init(NSLocalizedString(identifier.key, comment: ""))
    }

    var toDate: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = String(identifier: StringIdentifier.commonFormatToDate)
        return dateFormatter.date(from: self) ?? Date()
    }
}
