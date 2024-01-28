//
//  AssertionTests.swift
//
//
//  Created by Martin Kim Dung-Pham on 25.01.24.
//

import Foundation
import XCTest

@testable import Rorschach

class AssertionTests: XCTestCase {

    func testDefault() {
        let expectation = expectation(description: "")

        let sut = Assertion("abc") {
            _ = ""
            expectation.fulfill()
        }

        sut.assert()

        wait(for: [expectation], timeout: 0.1)
        XCTAssertEqual(sut.title, "abc")
    }

    func testThrowing() async throws {
        let expectation = expectation(description: "")

        let sut = Assertion("abc") {
            _ = try JSONDecoder().decode([String: String].self, from: self.json)
            expectation.fulfill()
        }

        try await sut.assert()

        await fulfillment(of: [expectation])
        XCTAssertEqual(sut.title, "abc")
    }

    private let json = """
        {"a":"A"}
        """.data(using: .utf8)!
}
