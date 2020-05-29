//
//  TestBuilder.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation

@_functionBuilder public struct TestBuilder<C, S1: Step, S2: Step, S: Step> {

    static public func buildBlock<C, S1, S2, S>(_ given: Given<C, S1, S2>, _ when: When<C, S>, _ then: Then<C>) -> (Given<C, S1, S2>, When<C, S>, Then<C>) where C == S1.Context, C == S.Context {
        return (given, when, then)
    }

//    static public func buildBlock(_ when: When<C>, _ then: Then<C>) -> (When<C>, Then<C>) {
//        return (when, then)
//    }
}
