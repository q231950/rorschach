//
//  ThenBuilder.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation


@resultBuilder public struct ThenBuilder {
    public static func buildBlock(_ assertion: Assertion?) -> Assertion? {
        assertion
    }
}
