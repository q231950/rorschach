//
//  GivenBuilder.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation

@_functionBuilder public struct GivenBuilder {

    public static func buildBlock(_ steps: Step...) -> [Step] {
        steps
    }
}

/// Adds initializers for `Given` which accept a `GivenBuilder`.
public extension Given {

    init(@GivenBuilder _ content: () -> [Step]) {
        self.init(steps: content())
    }

    init(@GivenBuilder _ content: () -> Step) {
        self.init(steps: [content()])
    }
}
