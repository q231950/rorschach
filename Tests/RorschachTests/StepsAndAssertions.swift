//
//  StepsAndAssertions.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation
import Rorschach

public class UniverseContext {
    var numberOfStars: Int = 0
}

// MARK: Steps

class ILearnABitMore: Step {

    var title: String {
        "I learn a bit more"
    }

    func execute(in context: inout UniverseContext) {
        print("I am learning...")
    }
}

struct IBuildARocket: Step {

    var title: String {
        "I build a rocket"
    }

    func execute(in context: inout UniverseContext) {
        context.numberOfStars = 7
        print("I am building a rocket that flies far enough to see 7 stars...")
    }
}

class ILaunchARocket: Step {

    var title: String {
        "I launch a rocket"
    }

    func execute(in context: inout UniverseContext) {
        print("I launch a rocket")
    }
}

// MARK: Assertions

class ICanSeeTheStars: Assertion<UniverseContext> {

    override var title: String {
        "I assert that I can see the stars"
    }

    override func assert(in context: UniverseContext) {
        print("I can see \(context.numberOfStars) stars!")
    }
}

