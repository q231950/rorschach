//
//  TestBuilder.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation

@_functionBuilder public struct TestBuilder<C> {

    public static func buildBlock(_ given: Given<C>, _ when: When<C>, _ then: Then<C>) -> (Given<C>, When<C>, Then<C>) {
        return (given, when, then)
    }

    public static func buildBlock(_ when: When<C>, _ then: Then<C>) -> (When<C>, Then<C>) {
        return (when, then)
    }
}
