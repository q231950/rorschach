import XCTest
@testable import the_uitest_language

final class the_uitest_languageTests: XCTestCase {

    func test_abc() {
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
        ("test_abc", test_abc),
    ]
}
