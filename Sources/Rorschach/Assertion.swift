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
    private var asyncThrowingContent: (() async throws -> Void)?

    public init(_ title: String? = nil, content: @escaping () async throws -> Void) {
        self.title = title
        self.asyncThrowingContent = content
    }

    public init(_ title: String? = nil, content: @escaping () -> Void) {
        self.title = title
        self.content = content
    }

    public func assert() async throws {
        try await asyncThrowingContent?()
    }

    public func assert() {
        content?()
    }
}
