//
//  And.swift
//  SwiftSandbox
//
//  Created by 宗像 恒 on 2025/07/08.
//

/// 2つのパーサーを連続して適用するコンビネーター
func and<OutputA, OutputB>(
    _ parserA: @escaping Parser<OutputA>,
    _ parserB: @escaping Parser<OutputB>
) -> Parser<(OutputA, OutputB)> { // 結果は両方のタプルになる

    return { input in
        // まず、1つ目のパーサーを実行
        let resultA = parserA(input)

        // Result型のflatMapを使うと、成功した場合の処理を簡潔に書ける
        return resultA.flatMap { (valueA, remainderA) in
            // 1つ目が成功したら、その残りの文字列(remainderA)で2つ目を実行
            let resultB = parserB(remainderA)
            // 2つ目の結果を加工して、最終的な結果を返す
            return resultB.map { (valueB, remainderB) in
                // 両方成功！結果をタプルにまとめ、最後の残りを返す
                return ((valueA, valueB), remainderB)
            }
        }
    }
}
