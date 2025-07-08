//
//  FirstParser.swift
//  SwiftSandbox
//
//  Created by 宗像 恒 on 2025/07/08.
//
import Foundation

// パース時に発生する可能性のあるエラー
enum ParseError: Error {
    case unexpectedInput(reason: String) // 予期せぬ入力があった
}

// これがパーサーの設計図！
// Output型の値をパースして、成功すれば (値, 残りの文字列) を、
// 失敗すればエラーを返す「関数」です。
typealias Parser<Output> = (String) -> Result<(Output, String), ParseError>

typealias Parser2<Output> = (String) throws -> (Output, String)
