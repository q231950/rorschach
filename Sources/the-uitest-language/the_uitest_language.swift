struct the_uitest_language {
    var text = "Hello, World!"

    func x() {
        Test {
            Step()
            Step()
        }
    }
}

@_functionBuilder struct TestBuilder {

    static func buildBlock(_ steps: Step...) -> [Step] {
        steps
    }
}

struct Test {

    let steps: [Step]

    init(steps: [Step]) {
        self.steps = steps
    }
}

extension Test {
    init(@TestBuilder _ content: () -> [Step]) {
        self.init(steps: content())
    }
}

struct Step {

}

struct Given {

}
