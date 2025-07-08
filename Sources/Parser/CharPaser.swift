//
//  CharPaser.swift
//  SwiftSandbox
//
//  Created by 宗像 恒 on 2025/07/08.
//

/// 指定された1文字をパースするパーサーを「作る」関数
func char(matching target: Character) -> Parser<Character> {
    
    // ↓ここからがパーサー本体（(String) -> Result<...> の部分）
    return { input in
        // 1. 入力文字列は空っぽじゃないか？
        // 2. 入力文字列の最初の文字は、探している文字(target)と同じか？
        guard let firstChar = input.first, firstChar == target else {
            // 違ったら失敗！
            let value = input.first.map { String($0) } ?? "end of input"
            return .failure(.unexpectedInput(reason: "Expected '\(target)' but found '\(value)'"))
        }
        
        // 成功！見つけた文字と、残りの文字列を返す
        let restOfString = String(input.dropFirst())
        return .success((firstChar, restOfString))
    }
    // ↑ここまでがパーサー本体
}
