//
//  Then.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation
import XCTest

/// The ``Then`` section of a test. Its content is an ``Assertion``
public struct Then {

    let assertion: Assertion?

    var title: String {
        if let assertionTitle = contentOnlyTitle {
            return "Then " + assertionTitle
        }
        return "Then " + (assertion?.title ?? "")
    }
    var contentOnlyTitle: String?

    public init(_ title: String, content: @escaping () -> Void) {
        contentOnlyTitle = title
        assertion = Assertion(content: content)
    }

    public init(@ThenBuilder _ content: () -> Assertion?) {
        assertion = content()
    }

    func assert() {
        assertion?.assert()
    }
}
