//
//  When.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation
import XCTest

public struct When<C> {

    let steps: [Step<C>]

    public init(_ content: @escaping (inout C) -> Void) {
        steps = [GeneralStep(content)]
    }

    public init(@WhenBuilder<C> _ content: () -> [Step<C>]) {
        steps = content()
    }

    func execute(in context: inout C) {
        steps.forEach { step in
            XCTContext.runActivity(named: step.title ) { _ in
                step.execute(in: &context)
            }
        }
    }
}

