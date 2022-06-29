//
//  XCTestCase+BDDStyle.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation
import XCTest

public protocol Expecting {

    /// A test's expectation with all three, a ``Given``, the ``When`` and the ``Then`` sections.
    ///
    /// Some tests need to prepare the test environment in a certain way to be able to make some assertion.
    ///
    /// **Example:**
    ///
    /// Here the *Given* section sets up the 'universe' to contain 3 stars as a precondition, before the *When* section performs some
    /// actions of which the result is validated in the *Assertion* of the *Then* section
    ///
    /// ```swift
    ///    expect {
    ///        Given("I have a universe with 3 stars") {
    ///            universe.numberOfStars = 3
    ///        }
    ///        When("I add a couple of stars") {
    ///            universe.numberOfStars += 20
    ///        }
    ///        Then("I can see the existing ones plus the stars I have added ✨") {
    ///            XCTAssertEqual(universe.numberOfStars, 23)
    ///        }
    ///    }
    ///    ```
    func expect(@ExpectationBuilder _ content: () -> (given: Given, when: When, then: Then))

    /// A test's expectation containing only the ``When`` and the ``Then`` sections.
    ///
    /// **Example:**
    ///
    /// ```swift
    ///    expect {
    ///        When("I add a couple of stars") {
    ///            universe.numberOfStars += 20
    ///        }
    ///        Then("I can see the stars I have added ✨") {
    ///            XCTAssertEqual(universe.numberOfStars, 20)
    ///        }
    ///    }
    ///    ```

    func expect(@ExpectationBuilder _ content: () -> (when: When, then: Then))
}

/// This extension adds support for test expectations to _XCTestCase_.
extension XCTestCase: Expecting {

    public func expect(@ExpectationBuilder _ content: () -> (given: Given, when: When, then: Then)) {

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

    public func expect(@ExpectationBuilder _ content: () -> (when: When, then: Then)) {

        XCTContext.runActivity(named: content().when.title ) { _ in
            content().when.execute()
        }

        XCTContext.runActivity(named: content().then.title ) { _ in
            content().then.assert()
        }
    }

}
