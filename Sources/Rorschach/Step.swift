//
//  Step.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation
import XCTest

public class Step {

    let title: String?
    let content: () -> Void

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
