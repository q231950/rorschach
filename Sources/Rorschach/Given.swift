//
//  Given.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation
import XCTest

public class Given<C, S1: Step, S2: Step> where C == S1.Context, C == S2.Context {

    let steps: (S1, S2)

    init(steps: (S1, S2)) {
        self.steps = steps
    }

    public convenience init(@GivenBuilder<C> _ content: () -> ((S1, S2))) {
        self.init(steps: content())
    }

    func execute(in context: inout C) {
        XCTContext.runActivity(named: steps.0.title ) { _ in
            steps.0.execute(in: &context)
        }

        XCTContext.runActivity(named: steps.1.title ) { _ in
            steps.1.execute(in: &context)
        }
    }
}
