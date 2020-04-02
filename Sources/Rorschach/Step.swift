//
//  Step.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation

open class Step<C> {

    public init() {}

    open func execute(in context: inout C) {}
}
