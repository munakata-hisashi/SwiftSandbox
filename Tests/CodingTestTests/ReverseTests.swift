import XCTest
@testable import CodingTest

final class SampleReverseTests: XCTestCase {
    func testReverseABCDE() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SampleReverse.reverse("ABCDE"), "EDCBA")
    }
    
    func testEmpty() {
        XCTAssertEqual(SampleReverse.reverse(""), "")
    }
    
    func testReverse2ABCDE() {
        XCTAssertEqual(SampleReverse.reverse2("ABCDE"), "EDCBA")
    }
}
