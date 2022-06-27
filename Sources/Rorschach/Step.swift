//
//  Step.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation
import XCTest

/// ``Step``s are part of the ``Given`` and the ``When`` sections of a test. Each of these sections can contain one or more ``Step``s.
public struct Step {

    let title: String?

    private let content: () -> Void

    private let uuid = UUID()

    public init(_ title: String? = nil, content: @escaping () -> Void) {
        self.content = content
        self.title = title
    }

    public func execute() {
        content()
    }

}

extension Step: Equatable {
    public static func == (lhs: Step, rhs: Step) -> Bool {
        lhs.uuid == rhs.uuid
    }
}
