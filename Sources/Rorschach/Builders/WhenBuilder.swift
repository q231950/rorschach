//
//  WhenBuilder.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation

@_functionBuilder public struct WhenBuilder<C, S: Step> where C == S.Context {

    public static func buildBlock(_ steps: S) -> S {
        steps
    }
}
