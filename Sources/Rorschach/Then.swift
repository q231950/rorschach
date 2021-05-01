//
//  Then.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation
import XCTest

public struct Then {

    let assertion: Assertion
    /// Returns _"Given"_ or _"Given I do this"_ when this _Given_ has a single step named _"I do this"_
    var title: String {
        if let title = _title {
            return "Then " + title
        }
        return "Then"
    }
    var _title: String?

    public init(_ title: String, content: @escaping () -> Void) {
        _title = title
        assertion = Assertion(content: content)
    }

    public init(@ThenBuilder _ content: () -> Assertion) {
        assertion = content()
    }

    func assert() {
        assertion.assert()
    }
}
