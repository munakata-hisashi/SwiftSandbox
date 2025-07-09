//
//  Or.swift
//  SwiftSandbox
//
//  Created by 宗像 恒 on 2025/07/08.
//

/// 2つのパーサーのうち、どちらか成功した方を採用するコンビネーター
func or<Output>(
    _ parserA: @escaping Parser<Output>,
    _ parserB: @escaping Parser<Output>
) -> Parser<Output> {

    return { input in
        let resultA = parserA(input)

        switch resultA {
        case .success:
            // 1つ目が成功したら、その結果を即採用！
            return resultA
        case .failure:
            // 1つ目が失敗したら、"何もなかったかのように"元の入力で2つ目を試す
            return parserB(input)
        }
    }
}
