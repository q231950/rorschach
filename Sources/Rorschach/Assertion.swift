//
//  Assertion.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation
import XCTest

/// The ``Assertion`` of the ``Then`` section can contain arbitrary code that makes a test's validation.
public struct Assertion {

    let title: String?
    private let content: () -> Void

    public init(_ title: String? = nil, content: @escaping () -> Void) {
        self.title = title
        self.content = content
    }

    public func assert() {
        content()
    }
}
