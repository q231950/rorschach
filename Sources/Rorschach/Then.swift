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

    public init(_ content: @escaping (C) -> Void) {
        assertion = GeneralAssertion(content)
    }

    public init(@ThenBuilder<C> _ content: () -> Assertion<C>) {
        assertion = content()
    }

    func assert(in context: C) {
        XCTContext.runActivity(named: assertion.title) { _ in
            assertion.assert(in: context)
        }
    }
}

public class GeneralAssertion<C>: Assertion<C> {
    let run: (_ inContext: C) -> Void

    public init(_ content: @escaping (_ context: C) -> Void) {
        self.run = content
    }

    override public func assert(in context: C) {
        run(context)
    }
}
