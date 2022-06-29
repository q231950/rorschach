import XCTest
import Rorschach

/// Some arbitrary model to give the tests more sense.
class Universe {
    var numberOfStars: Int = 0
}

final class RorschachTests: XCTestCase {

    /// An Example test case with general steps and assertions.
    ///
    /// ``Given`` certain preconditions ``When`` some event occurs ``Then`` some behaviour should be observed.
    ///
    func test_simple_example() {

        let universe = Universe()

        expect {
            Given("I have a universe without any stars") {
                universe.numberOfStars = 0
            }
            When("I add a couple of stars") {
                universe.numberOfStars += 23
            }
            Then("I can see the stars I have added ✨") {
                XCTAssertEqual(universe.numberOfStars, 23)
            }
        }
    }

    /// An Example test case without a ``Given`` section.
    func test_simple_example_short() {

        let universe = Universe()

        expect {
            When("I fill a universe with 5 stars") {
                universe.numberOfStars = 5
            }
            Then("I can see 5 stars") {
                XCTAssertEqual(universe.numberOfStars, 5)
            }
        }
    }

    /// An Example test case that highlights multiple ``Step``s within ``Given`` and ``When`` sections.
    func test_complex_example() {

        /// Some object model that holds the overall count of stars across universes.
        /// This could be a page object model that allows abstracted away interaction within a UI test, for example.
        struct UniverseController {
            internal private(set) var count = 0

            mutating func add(stars amount: Int) {
                count += amount
            }

            mutating func squareStars() {
                count *= count
            }
        }

        let universeA = Universe()
        let universeB = Universe()
        var universeController = UniverseController()

        expect {
            Given {
                Step("I have universe A with 2 stars") {
                    universeA.numberOfStars = 2
                }
                Step("I have another universe B with 6 stars") {
                    universeB.numberOfStars = 6
                }
            }
            When {
                Step("I add 2 more stars to universe A") {
                    universeA.numberOfStars += 2
                }
                Step("I sum up the stars") {
                    universeController.add(stars: universeA.numberOfStars + universeB.numberOfStars)
                }
                Step("I bring them into a second dimension") {
                    universeController.squareStars()
                }
            }
            Then("I can see 100 stars ✨") {
                XCTAssertEqual(universeController.count, 100)
            }
        }
    }

    /// A variable to showcase scope in the `test_scope_example` test.
    var universeAtInstanceScope = "abc"

    static var universeAtClassScope = "ABC"

    /// An Example test case that highlights choices of scope to define test data and the subject under test.
    /// This test checks if Rorschach respects a given scope.
    ///
    /// This test `expect`s a certain behaviour with a modification of
    ///     1. some instance context at the scope of the test case
    ///     2. some funtion context at the scope of a test function
    ///
    func test_scope_example() {

        let universeAtFunctionScope = Universe()

        expect {
            Given("I have a universe without any stars") {
                universeAtFunctionScope.numberOfStars = 0
            }
            When("I add a couple of stars") {
                universeAtFunctionScope.numberOfStars += 23
                self.universeAtInstanceScope = "123"
                RorschachTests.universeAtClassScope = "321"
            }
            Then("I can see the stars I have added ✨") {
                XCTAssertEqual(universeAtFunctionScope.numberOfStars, 23)
                XCTAssertEqual(self.universeAtInstanceScope, "123")
                XCTAssertEqual(RorschachTests.universeAtClassScope, "321")
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
