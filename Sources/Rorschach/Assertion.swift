//
//  Assertion.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation
import XCTest

open class Assertion {

    let title: String?
    let content: () -> Void

    public init(_ title: String? = nil, content: @escaping () -> Void) {
        self.title = title
        self.content = content
    }

    public func assert() {
        content()
    }
}
