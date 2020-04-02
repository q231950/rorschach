//
//  When.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation

public struct When<C> {

    let step: Step<C>

    public init(@WhenBuilder<C> _ content: () -> Step<C>) {
        step = content()
    }

    func execute(in context: inout C) {
        step.execute(in: &context)
    }
}

