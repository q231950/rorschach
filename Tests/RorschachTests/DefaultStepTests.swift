import Foundation
import Rorschach
import XCTest

final class DefaultStepTests: XCTestCase {

    func test_defaultAssertion() {
        var context = DefaultContext()
        
        expect(in: &context) {
            When {
                DefaultStep<DefaultContext>("I sum up 2 ones") {

                }
            }
            Then {
                DefaultAssertion<DefaultContext>("1 + 1 = 2") {
                    XCTAssertEqual(1+1, 2)
                }
            }
        }
    }
}
