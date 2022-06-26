import XCTest
import Rorschach

class UniverseContext {
    var numberOfStars: Int = 0
}

final class RorschachTests: XCTestCase {

    /// An Example test case with general steps and assertions.
    ///
    /// This test `expect`s a certain behaviour with a modification of
    ///     1. some instance context at the scope of the test case
    ///     2. some funtion context at the scope of a test function
    ///
    /// `Given` certain preconditions `When` some event occurs `Then` some behaviour should be observed.
    ///
    func test_simple_example() {

        let context = UniverseContext()

        expect {
            Given("I have a universe without any stars") {
                context.numberOfStars = 0
            }
            When("I add a couple of stars") {
                context.numberOfStars += 23
            }
            Then("I can see the stars I have added ✨") {
                XCTAssertEqual(context.numberOfStars, 23)
            }
        }
    }

    /// An Example test case without a `Given` block.
    func test_simple_example_short() {

        let context = UniverseContext()

        expect {
            When("I fill a universe with 5 stars") {
                context.numberOfStars = 5
            }
            Then("I can see 5 stars") {
                XCTAssertEqual(context.numberOfStars, 5)
            }
        }
    }

    /// An Example test case that highlights multiple `Step`s within `Given` and `When` blocks.
    /// Also, an object model is used to show how to deal with more structured tests.
    func test_complex_example() {

        /// Some object model that holds the overall count of stars across universes.
        /// This could be a page object model that allows abstracted away interaction within a UI test, for example.
        struct ObjectModel {
            internal private(set) var count = 0

            mutating func add(stars amount: Int) {
                count += amount
            }

            mutating func squareStars() {
                count *= count
            }
        }

        let universeA = UniverseContext()
        let universeB = UniverseContext()
        var context = ObjectModel()

        expect {
            Given {
                Step("I have universe A with 4 stars") {
                    universeA.numberOfStars = 4
                }
                Step("I have another universe B with 6 stars") {
                    universeB.numberOfStars = 6
                }
            }
            When {
                Step("I sum up the stars") {
                    context.add(stars: universeA.numberOfStars + universeB.numberOfStars)
                }
                Step("I bring them into a second dimension") {
                    context.squareStars()
                }
            }
            Then("I can see 100 stars ✨") {
                XCTAssertEqual(context.count, 100)
            }
        }
    }

    /// A variable to showcase scope in the `test_scope_example` test.
    var someInstanceContext = "abc"

    /// An Example test case that highlights choices of scope to define test data and the subject under test.
    /// This test checks if Rorschach respects a given scope.
    ///
    /// This test `expect`s a certain behaviour with a modification of
    ///     1. some instance context at the scope of the test case
    ///     2. some funtion context at the scope of a test function
    ///
    func test_scope_example() {

        let someFunctionContext = UniverseContext()

        expect {
            Given("I have a universe without any stars") {
                someFunctionContext.numberOfStars = 0
                self.someInstanceContext = "123"
            }
            When("I add a couple of stars") {
                someFunctionContext.numberOfStars += 23
            }
            Then("I can see the stars I have added ✨") {
                XCTAssertEqual(someFunctionContext.numberOfStars, 23)
                XCTAssertEqual(self.someInstanceContext, "123")
            }
        }
    }


    static var allTests = [
        ("test_simple_example", test_simple_example),
        ("test_simple_example_short", test_simple_example_short),
        ("test_complex_example", test_complex_example),
        ("test_scope_example", test_scope_example),
    ]
}
