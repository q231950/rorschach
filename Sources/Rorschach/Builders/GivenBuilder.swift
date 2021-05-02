//
//  GivenBuilder.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation

@resultBuilder public struct GivenBuilder {

    public static func buildBlock(_ steps: Step?...) -> [Step?] {
        steps
    }
}

