//
//  CustomIdentifier.swift
//  testBook
//
//  Created by Charles on 05/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import Foundation

public protocol CustomIdentifier {
    var key: String { get }
}

extension CustomIdentifier where Self: RawRepresentable, Self.RawValue == String {
    public var key: String { return self.rawValue }
}
