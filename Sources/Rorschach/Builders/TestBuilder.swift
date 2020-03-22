//
//  TestBuilder.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation

@_functionBuilder public struct TestBuilder {
    static public func buildBlock(_ given: Given, _ when: When, _ then: Then) -> (Given, When, Then) {
        (given, when, then)
    }
}
