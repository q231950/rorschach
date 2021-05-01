import XCTest
import Rorschach

public class UniverseContext {
    var numberOfStars: Int = 0
}

final class RorschachTests: XCTestCase {

    /// An Example test case with general steps and assertions.
    ///
    /// This test `expect`s a certain behaviour.
    ///
    /// `Given` certain preconditions `When` some event occurs `Then` some behaviour should be observed.
    ///
    func test_unitTest_example() {

        let context = UniverseContext()

        expect {
            Given("I have a universe without any stars") {
                context.numberOfStars = 5
            }
            When("I add a couple of stars") {
                context.numberOfStars = 1_000_000_000_023
            }
            Then("I can see the stars I have added ✨") {
                XCTAssertEqual(context.numberOfStars, 1_000_000_000_023)
            }
        }
    }

    func test_unitTest_example_short() {

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

    func test_uiTest_example() {

        struct Universe {
            var numberOfStars = 0
        }

        struct Context {
            var count = 0
        }

        var universeA = Universe()
        var universeB = Universe()
        var context = Context()

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
                    context.count = universeA.numberOfStars + universeB.numberOfStars
                }
                Step("I bring them into a second dimension") {
                    context.count *= context.count
                }
            }
            Then("I can see 100 stars ✨") {
                XCTAssertEqual(context.count, 100)
            }
        }
    }

//    static var allTests = [
//        ("test_withGeneralSteps_andAssertions", test_unitTest_example),
//        ("test_iCanSeeTheStars", test_iCanSeeTheStars),
//        ("test_iCanLaunchMyRocket", test_iCanLaunchMyRocket),
//    ]
}
