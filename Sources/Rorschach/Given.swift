//
//  Given.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation

public class Given<C> {

    let steps: [Step<C>]

    init(steps: [Step<C>]) {
        self.steps = steps
    }

    public convenience init(@GivenBuilder<C> _ content: () -> [Step<C>]) {
        self.init(steps: content())
    }

    public convenience init(@GivenBuilder<C> _ content: () -> Step<C>) {
        self.init(steps: [content()])
    }

    func execute(in context: C) {
        steps.forEach { $0.execute(in: context) }
    }
}
