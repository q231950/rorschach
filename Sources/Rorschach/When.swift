//
//  When.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation
import XCTest

public class When<C, S: Step> where C == S.Context  {

    let step: S

    public init(@WhenBuilder<C, S> _ content: () -> S) {
        step = content()
    }

    func execute(in context: inout C) {
        XCTContext.runActivity(named: step.title) { activity in
            step.execute(in: &context)
        }
    }
}

