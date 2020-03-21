import XCTest
@testable import the_uitest_language

final class the_uitest_languageTests: XCTestCase {

    func test_iCanSeeTheStars() {
        test {
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


    static var allTests = [
        ("test_iCanSeeTheStars", test_iCanSeeTheStars),
    ]
}
