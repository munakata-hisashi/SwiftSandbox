//
//  Test.swift
//  SwiftSandbox
//
//  Created by 宗像 恒 on 2025/07/08.
//

import Testing
@testable import Parser

struct ParserTest {

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
    
    @Test func parseAandB() async throws {
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
    
    @Test func parseAorB() async throws {
        let parseA = char(matching: "a")
        let parseB = char(matching: "b")
        let parseAB = or(parseA, parseB)
        let result = parseAB("apple")
        
        #expect(result.isSuccess == true)
        let (value, rest) = try result.get()
        #expect(value == "a")
        #expect(rest == "pple")
        
        let result2 = parseAB("boy")
        #expect(result2.isSuccess == true)
        let (value2, rest2) = try result2.get()
        #expect(value2 == "b")
        #expect(rest2 == "oy")
    }
    
    @Test func parseManyA() async throws {
        // 'a'を探すパーサー
        let parseA = char(matching: "a")

        // 'a'の連続を探す、合成されたパーサー！
        let parseManyA = many(parseA)
        
        let result = parseManyA("aaabc")
        #expect(result.isSuccess == true)
        let (values, rest) = try result.get()
        #expect(values == ["a", "a", "a"])
        #expect(rest == "bc")
        
        let result2 = parseManyA("cde")
        #expect(result2.isSuccess == true)
        let (values2, rest2) = try result2.get()
        #expect(values2.isEmpty == true)
        #expect(rest2 == "cde")
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
