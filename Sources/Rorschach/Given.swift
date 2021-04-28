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

    public init(_ content: @escaping (inout C) -> Void) {
        steps = [GeneralStep(content)]
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

public class GeneralStep<C>: Step<C> {
    let content: (_ inContext: inout C) -> Void

    public init(_ content: @escaping (_ context: inout C) -> Void) {
        self.content = content
    }

    override public func execute(in context: inout C) {
        content(&context)
    }
}
