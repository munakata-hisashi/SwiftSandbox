import XCTest
@testable import SampleProJava

final class SampleCodeOfProJavaPart4Tests: XCTestCase {
    func testABCCCBAABCC() {
        XCTAssertEqual(ProJava13_1_1.removeDuplicate("ABCCCBAABCC"), "ABCBABC")
    }
    
    func testABCCCBAABCC2() {
        XCTAssertEqual(ProJava13_1_1.removeDuplicate2("ABCCCBAABCC"), "ABCBABC")
    }
    
    func testReplaceOddEvent() {
        XCTAssertEqual(ProJava13_1_1.replaceOddEven("abcde"), "badce")
    }
    
    func testFliter() {
        XCTAssertEqual(ProJava13_1_1.filter([3, 6, 9, 4, 2, 1, 5]), [6, 9, 9, 4, 2, 5, 5])
    }
}
