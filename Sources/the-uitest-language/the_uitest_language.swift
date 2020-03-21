import Foundation

func test(@TestBuilder _ content: () -> (Given, When, Then)) {
    content().0.steps.forEach { $0.execute() }
    content().1.step.execute()
    content().2.assertion.assert()
}

@_functionBuilder struct TestBuilder {
    static func buildBlock(_ given: Given, _ when: When, _ then: Then) -> (Given, When, Then) {
        (given, when, then)
    }
}

// MARK: Given

@_functionBuilder struct GivenWhenBuilder {

    static func buildBlock(_ steps: Step...) -> [Step] {
        steps
    }
}

struct Given {
    let steps: [Step]

    init(steps: [Step]) {
        self.steps = steps
    }

    init(@GivenWhenBuilder _ content: () -> [Step]) {
        self.init(steps: content())
    }

    init(@GivenWhenBuilder _ content: () -> Step) {
        self.init(steps: [content()])
    }
}

// MARK: When

struct When {
    let step: Step

    init(@GivenWhenBuilder _ content: () -> Step) {
        step = content()
    }
}

// MARK: Then

struct Then {
    let assertion: Assertion

    init(@ThenBuilder _ content: () -> Assertion) {
        assertion = content()
    }
}

@_functionBuilder struct ThenBuilder {

    static func buildBlock(_ assertion: Assertion) -> Assertion {
        assertion
    }
}

// MARK: Assertions

protocol Assertion {
    func assert()
}

struct ICanSeeTheStars: Assertion {
    func assert() {
        print("I can see the stars!")
    }
}

// MARK: Steps

protocol Step {
    func execute()
}

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
