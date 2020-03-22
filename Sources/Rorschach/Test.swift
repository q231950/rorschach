//
//  Test.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation

public func expect(@TestBuilder _ content: () -> (Given, When, Then)) {
    content().0.steps.forEach { $0.execute() }
    content().1.step.execute()
    content().2.assertion.assert()
}
