import XCTest
import Rorschach

final class RorschachTests: XCTestCase {

    /// An Example test case.
    ///
    /// This test `expect`s a certain behaviour.
    ///
    /// `Given` certain preconditions `When` some event occurs `Then` some behaviour should be observed.
    ///
    func test_iCanSeeTheStars() {
        var context = UniverseContext()

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
        var context = UniverseContext()

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
        ("test_iCanSeeTheStars", test_iCanSeeTheStars),
        ("test_iCanLaunchMyRocket", test_iCanLaunchMyRocket),
    ]
}
