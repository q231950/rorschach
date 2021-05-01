//
//  Test.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation
import XCTest

public func expect(@TestBuilder _ content: () -> (given: Given, when: When, then: Then)) {

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

public func expect(@TestBuilder _ content: () -> (when: When, then: Then)) {

    XCTContext.runActivity(named: content().when.title ) { _ in
        content().when.execute()
    }

    XCTContext.runActivity(named: content().then.title ) { _ in
        content().then.assert()
    }
}
