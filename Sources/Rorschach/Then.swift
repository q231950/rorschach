//
//  Then.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation
import XCTest

public struct Then<C> {

    let assertion: Assertion<C>

    public init(@ThenBuilder<C> _ content: () -> Assertion<C>) {
        assertion = content()
    }

    func assert(in context: C) {
        XCTContext.runActivity(named: assertion.title) { _ in
            assertion.assert(in: context)
        }
    }
}
