//
//  WhenBuilder.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation

@_functionBuilder public struct WhenBuilder {

    public static func buildBlock(_ steps: Step...) -> [Step] {
        steps
    }
}

public extension When {
    init(@WhenBuilder _ content: () -> Step) {
        step = content()
    }
}
