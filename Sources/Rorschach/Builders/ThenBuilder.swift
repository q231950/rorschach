//
//  ThenBuilder.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation


@_functionBuilder struct ThenBuilder {

    static func buildBlock(_ assertion: Assertion) -> Assertion {
        assertion
    }
}

public extension Then {
    init(@ThenBuilder _ content: () -> Assertion) {
        assertion = content()
    }
}
