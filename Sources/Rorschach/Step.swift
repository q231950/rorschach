//
//  Step.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation

public struct EmptyStep<C>: Step {
    public typealias Context = C

    public var title: String {
        "emptyness"
    }

    public func execute(in context: inout Context) {}
}

public protocol Step {

    associatedtype Context

    var title: String {get}

    func execute(in context: inout Context)
}
