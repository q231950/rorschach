//
//  GivenBuilder.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation

public struct GivenTuple<C> {

    init(_ steps: Any...) {

    }
}

@_functionBuilder public struct GivenBuilder<C> {

    public static func buildBlock<C, S>(_ steps: [S]) -> (GivenTuple<C>)
        where S: Step, C == S.Context {

            guard steps.count >= 2 else {
                return GivenTuple(EmptyStep<C>(), EmptyStep<C>())
            }

            return GivenTuple(steps[0], steps[1])
    }
}

