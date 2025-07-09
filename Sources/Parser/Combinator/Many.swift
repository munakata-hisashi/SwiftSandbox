//
//  Many.swift
//  SwiftSandbox
//
//  Created by 宗像 恒 on 2025/07/08.
//

/// あるパーサーを0回以上繰り返し適用するコンビネーター
func many<Output>(_ parser: @escaping Parser<Output>) -> Parser<[Output]> {
    
    return { input in
        var results: [Output] = []
        var remainder = input
        
        // パーサーが成功し続ける限りループする
        while let result = try? parser(remainder).get() {
            // 成功したら、結果を配列に追加
            results.append(result.0)
            // 残りの文字列を更新
            remainder = result.1
        }
        
        // `many`は0回以上の繰り返しなので、それ自体は失敗しない
        return .success((results, remainder))
    }
}
