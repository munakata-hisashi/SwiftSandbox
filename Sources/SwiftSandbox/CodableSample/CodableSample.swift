//
//  CodableSample.swift
//  SwiftSandbox
//
//  Created by 宗像 恒 on 2025/07/30.
//
import Foundation

// --- サンプルコード ---

// (1) 古いAPIからのJSON（genderなし）
let oldJsonString = """
{
  "person": {
    "name": "田中太郎",
    "age": 30,
    "isStudent": false,
    "email": "tanaka@example.com"
  }
}
"""

// (2) 新しいAPIからのJSON（genderあり）
let newJsonString = """
{
  "person": {
    "name": "鈴木花子",
    "age": 25,
    "isStudent": true,
    "email": "suzuki@example.com",
    "gender": "女性"
  }
}
"""

// APIレスポンス全体を表すモデル
struct UserProfile: Codable {
    let person: Person
}

// personオブジェクトを表すモデル
struct Person: Codable {
    let name: String
    let age: Int
    let isStudent: Bool
    let email: String
    let gender: String? // ✨ 新しいフィールドをオプショナルで定義
}

func decodeAndUseProfile(from jsonString: String) {
    guard let jsonData = jsonString.data(using: .utf8) else {
        print("JSONデータへの変換に失敗しました。")
        return
    }

    let decoder = JSONDecoder()
    do {
        // UserProfileモデルへデコードを試みる
        let profile = try decoder.decode(UserProfile.self, from: jsonData)
        let person = profile.person

        print("名前: \(person.name)")

        // genderが存在する場合のみ、その値を表示する
        if let gender = person.gender {
            print("性別: \(gender)") // genderがあれば表示
        } else {
            print("性別: 情報なし") // genderがなければ（nilなら）こちらが実行される
        }
        print("--------------------")

    } catch {
        // オプショナルでないフィールドが無い、型が違うなどの場合はここに来る
        print("デコードに失敗しました: \(error)")
    }
}

