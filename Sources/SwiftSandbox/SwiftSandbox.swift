@main
public struct SwiftSandbox {
    public private(set) var text = "Hello, World!"

    public static func main() async throws {
        let array = [1, 2, 3, 4]
        let offset = 1
        let value: Int = array[offset]
        print(value)
    }
}
