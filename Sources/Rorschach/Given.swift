//
//  Given.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation
import XCTest

public class Given<C> {

    let steps: [Step<C>]

    init(steps: [Step<C>]) {
        self.steps = steps
    }

    public convenience init(@GivenBuilder<C> _ content: () -> [Step<C>]) {
        self.init(steps: content())
    }

    public convenience init(@GivenBuilder<C> _ content: () -> Step<C>) {
        self.init(steps: [content()])
    }

    func execute(in context: inout C) {
        steps.forEach { step in
            XCTContext.runActivity(named: step.title ) { _ in
                step.execute(in: &context)
            }
        }
    }
}
