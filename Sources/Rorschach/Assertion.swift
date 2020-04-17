//
//  Assertion.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation

open class Assertion<C> {

    public init() {}

    open var title: String {
        "\(type(of: self))"
    }

    open func assert(in context: C) {}
}
