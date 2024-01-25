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
    private var content: (() -> Void)?
    private var asyncContent: (() async -> Void)?

    public init(_ title: String? = nil, content: @escaping () async -> Void) {
        self.title = title
        self.asyncContent = content
    }

    public init(_ title: String? = nil, content: @escaping () -> Void) {
        self.title = title
        self.content = content
    }

    public func assert() async {
        await asyncContent?()
    }

    public func assert() {
        content?()
    }
}
