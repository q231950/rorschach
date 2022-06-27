//
//  When.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation
import XCTest

public struct When {

    /// Returns "When I do this"_ when this ``When`` either has content named _"I do this"_ or the first of its steps is titled _"I do this"_.
    var title: String {
        guard let firstStep = steps.first else { return "When" }

        if let stepTitle = contentOnlyTitle {
            return "When " + stepTitle
        }
        return "When " + (firstStep?.title ?? "")
    }
    var contentOnlyTitle: String?

    /// The ``Step``s to be executed as part of the ``When``.
    let steps: [Step?]

    /// Shorthand for a ``When`` with a single ``Step`` with some content
    public init(_ title: String, content: @escaping () -> Void) {
        contentOnlyTitle = title
        steps = [Step(content: content)]
    }

    /// Initializes a ``When`` with the given ``Step``s
    public init(@WhenBuilder _ content: () -> [Step?]) {
        steps = content()
    }

    func execute() {
        steps.forEach { step in
            if step != steps.first, let title = step?.title {
                XCTContext.runActivity(named: "And \(title)" ) { _ in
                    step?.execute()
                }
            } else {
                step?.execute()
            }
        }
    }
}
