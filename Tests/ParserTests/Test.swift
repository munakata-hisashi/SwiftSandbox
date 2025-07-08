//
//  Test.swift
//  SwiftSandbox
//
//  Created by 宗像 恒 on 2025/07/08.
//

import Testing
@testable import Parser

struct Test {

    @Test func parseA() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let parseA = char(matching: "a")
        
        let result = parseA("abc")

        #expect(result.isSuccess == true)
        let (value, rest) = try result.get()
        #expect(value == "a")
        #expect(rest == "bc")
    }

    @Test func parseFailure() async throws {
        let parseA = char(matching: "a")
        
        let result = parseA("bcd")
        #expect(result.isSuccess == false)
    }
    
    @Test func parseAB() async throws {
        let parseA = char(matching: "a")
        let parseB = char(matching: "b")
        let parseAB = and(parseA, parseB)
        let result = parseAB("abc")
        #expect(result.isSuccess == true)
        let (value, rest) = try result.get()
        #expect(value.0 == "a")
        #expect(value.1 == "b")
        #expect(rest == "c")
    }
}

extension Result {
    var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }
    
}
