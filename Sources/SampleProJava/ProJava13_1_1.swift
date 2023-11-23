// プロになるJavaの第４部 p264のSwift版
// 文字列の重複を排除する

import Foundation

enum ProJava13_1_1 {
    static func removeDuplicate(_ str: String) -> String {
        var result: String = ""
        
        for i in str.indices {
            if i > str.startIndex && str[i] == str[str.index(before: i)] {
                continue
            }
            result += String(str[i])
        }
        return result
    }
    
    static func removeDuplicate2(_ str: String) -> String {
        var prev = "0000"
        var result = ""
        for c in str {
            if String(c) == prev {
                continue
            }
            result += String(c)
            prev = String(c)
        }
        return result
    }
    
    /// p267の練習
    static func replaceOddEven(_ str: String) -> String {
        var charArray = Array(str)
        let count = str.count
        for i in 1...count {
            if i % 2 == 1 && i != count {
                let tmp = charArray[i - 1]
                charArray[i - 1] = charArray[i]
                charArray[i] = tmp
            }
        }
        return String(charArray)
    }
    
    /// p267の練習。1つ後の要素と比べて大きい方を格納した配列を出力する
    static func filter(_ intArray: [Int]) -> [Int] {
        var result: [Int] = []
        for i in 0..<intArray.count - 1 {
            result.append(max(intArray[i], intArray[i + 1]))
        }
        result.append(intArray.last!)
        return result
    }
}
