//
//  Test.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation

public func expect<C>(in context: inout C, @TestBuilder<C> _ content: () -> (given: Given<C>, when: When<C>, then: Then<C>)) {

    content().given.execute(in: &context)

    content().when.execute(in: &context)

    content().then.assert(in: context)
}

public func expect<C>(in context: inout C, @TestBuilder<C> _ content: () -> (when: When<C>, then: Then<C>)) {

    content().when.execute(in: &context)

    content().then.assert(in: context)
}
