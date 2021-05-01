//
//  When.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation
import XCTest

public struct When {

    /// Returns "When I do this"_ when this _When_ either has content named _"I do this"_ or the first of its steps is titled _"I do this"_.
    var title: String {
        if let stepTitle = contentOnlyTitle {
            return "When " + stepTitle
        }
        return "When " + (steps.first?.title ?? "")
    }
    var contentOnlyTitle: String?

    /// The _Step_s to be executed as part of the _When_.
    let steps: [Step]

    /// Shorthand for a _When_ with a single step with some content
    public init(_ title: String, content: @escaping () -> Void) {
        contentOnlyTitle = title
        steps = [Step(content: content)]
    }

    /// Initializes a _When_ with the given _Step_s
    public init(@WhenBuilder _ content: () -> [Step]) {
        steps = content()
    }

    func execute() {
        steps.forEach { step in
            if step != steps.first, let title = step.title {
                XCTContext.runActivity(named: "And \(title)" ) { _ in
                    step.execute()
                }
            } else {
                step.execute()
            }
        }
    }
}
