import Foundation
import XCTest

public struct DefaultContext {
    let app: XCUIApplication?
    let test: XCTestCase?

    public init(app: XCUIApplication? = nil, test: XCTestCase? = nil) {
        self.app = app
        self.test = test
    }
}
