//
//  StepsAndAssertions.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation
import Rorschach

// MARK: Steps

struct ILearnABitMore: Step {
    func execute() {
        print("I am learning...")
    }
}

struct IBuildARocket: Step {
    func execute() {
        print("I am building a rocket...")
    }
}

struct ILaunchARocket: Step {
    func execute() {
        print("I launch a rocket")
    }
}

// MARK: Assertions

struct ICanSeeTheStars: Assertion {
    func assert() {
        print("I can see the stars!")
    }
}

