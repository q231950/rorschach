//
//  ThenBuilder.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation


@_functionBuilder struct ThenBuilder<C> {

    static func buildBlock(_ assertion: Assertion<C>) -> Assertion<C> {
        assertion
    }
}
