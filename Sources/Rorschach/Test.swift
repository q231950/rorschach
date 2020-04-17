//
//  Test.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation
import XCTest

public func expect<C>(in context: inout C, @TestBuilder<C> _ content: () -> (given: Given<C>, when: When<C>, then: Then<C>)) {

    XCTContext.runActivity(named: "Given" ) { _ in
        content().given.execute(in: &context)
    }

    XCTContext.runActivity(named: "When" ) { _ in
        content().when.execute(in: &context)
    }

    XCTContext.runActivity(named: "Then" ) { _ in
        content().then.assert(in: context)
    }
}

public func expect<C>(in context: inout C, @TestBuilder<C> _ content: () -> (when: When<C>, then: Then<C>)) {

    XCTContext.runActivity(named: "When" ) { _ in
        content().when.execute(in: &context)
    }

    XCTContext.runActivity(named: "Then" ) { _ in
        content().then.assert(in: context)
    }
}
