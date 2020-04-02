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

class ILearnABitMore: Step<UniverseContext> {

    override func execute(in context: inout UniverseContext) {
        print("I am learning...")
    }
}

class IBuildARocket: Step<UniverseContext> {

    override func execute(in context: inout UniverseContext) {
        context.numberOfStars = 7
        print("I am building a rocket that flies far enough to see 7 stars...")
    }
}

class ILaunchARocket: Step<UniverseContext> {

    override func execute(in context: inout UniverseContext) {
        print("I launch a rocket")
    }
}

// MARK: Assertions

class ICanSeeTheStars: Assertion<UniverseContext> {

    override func assert(in context: UniverseContext) {
        print("I can see \(context.numberOfStars) stars!")
    }
}

