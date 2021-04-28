//
//  GivenBuilder.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation

@resultBuilder public struct GivenBuilder<C> {

    public static func buildBlock(_ steps: Step<C>...) -> [Step<C>] {
        steps
    }
}

