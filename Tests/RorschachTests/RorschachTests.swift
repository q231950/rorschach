import XCTest
import Rorschach

final class RorschachTests: XCTestCase {

    var context = UniverseContext()

    /// An Example test case with general steps and assertions.
    ///
    /// This test `expect`s a certain behaviour.
    ///
    /// `Given` certain preconditions `When` some event occurs `Then` some behaviour should be observed.
    ///
    func test_withGeneralSteps_andAssertions() {

        var x = 9

        expect(in: &context) {
            Given<UniverseContext> { context in
                context.numberOfStars = 7
                x = 4
            }
            When<UniverseContext> { context in
                x = 5
            }
            Then<UniverseContext> { context in
                XCTAssertEqual(context.numberOfStars, 7)
                XCTAssertEqual(x, 5)
            }
        }
    }

    /// An Example test case.
    ///
    /// This test `expect`s a certain behaviour.
    ///
    /// `Given` certain preconditions `When` some event occurs `Then` some behaviour should be observed.
    ///
    func test_iCanSeeTheStars() {

        expect(in: &context) {
            Given {
                ILearnABitMore()
                IBuildARocket()
            }
            When {
                ILaunchARocket()
            }
            Then {
                ICanSeeTheStars()
            }
        }
    }

    func test_iCanLaunchMyRocket() {

        expect(in: &context) {
            When {
                ILaunchARocket()
            }
            Then {
                ICanSeeTheStars()
            }
        }
    }

    static var allTests = [
        ("test_withGeneralSteps_andAssertions", test_withGeneralSteps_andAssertions),
        ("test_iCanSeeTheStars", test_iCanSeeTheStars),
        ("test_iCanLaunchMyRocket", test_iCanLaunchMyRocket),
    ]
}
