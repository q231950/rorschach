//
//  XCTestCase+BDDStyle.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation
import XCTest

/// This extension adds support for test expectations to _XCTestCase_.
extension XCTestCase: Expecting {}

public protocol Expecting {
    func expect(@ExpectationBuilder _ content: () -> (given: Given, when: When, then: Then))

    func expect(@ExpectationBuilder _ content: () -> (when: When, then: Then))
}

public extension Expecting {

    func expect(@ExpectationBuilder _ content: () -> (given: Given, when: When, then: Then)) {

        XCTContext.runActivity(named: content().given.title ) { _ in
            content().given.execute()
        }

        XCTContext.runActivity(named: content().when.title ) { _ in
            content().when.execute()
        }

        XCTContext.runActivity(named: content().then.title ) { _ in
            content().then.assert()
        }
    }

    func expect(@ExpectationBuilder _ content: () -> (when: When, then: Then)) {

        XCTContext.runActivity(named: content().when.title ) { _ in
            content().when.execute()
        }

        XCTContext.runActivity(named: content().then.title ) { _ in
            content().then.assert()
        }
    }

}
