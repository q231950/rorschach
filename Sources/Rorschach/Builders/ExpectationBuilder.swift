//
//  ExpectationBuilder.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation

@resultBuilder public struct ExpectationBuilder {

    public static func buildBlock(_ given: Given, _ when: When, _ then: Then) -> (Given, When, Then) {
        return (given, when, then)
    }

    public static func buildBlock(_ when: When, _ then: Then) -> (When, Then) {
        return (when, then)
    }
}
