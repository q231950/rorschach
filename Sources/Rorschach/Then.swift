//
//  Then.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation

public struct Then<C> {

    let assertion: Assertion<C>

    public init(@ThenBuilder<C> _ content: () -> Assertion<C>) {
        assertion = content()
    }

    func assert(in context: C) {
        assertion.assert(in: context)
    }
}
