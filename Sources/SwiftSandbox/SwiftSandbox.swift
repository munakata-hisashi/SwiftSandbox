import Foundation
@main
public struct SwiftSandbox {

    public static func main() async throws {
        // 実行
        print("古いAPIレスポンスをパース:")
        decodeAndUseProfile(from: oldJsonString)

        print("新しいAPIレスポンスをパース:")
        decodeAndUseProfile(from: newJsonString)
    }
}
