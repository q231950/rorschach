//
//  WhenBuilder.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation

@resultBuilder public struct WhenBuilder {

    public static func buildBlock(_ steps: Step?...) -> [Step?] {
        steps
    }
}
