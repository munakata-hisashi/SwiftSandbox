@main
public struct SwiftSandbox {
    public private(set) var text = "Hello, World!"

    public static func main() async throws {
        let array = [1, 2, 3]
        print(array.description)
        let users = [User(name: "hoge"), User(name: "fuga")]
        print(users.description)
        print(users.debugDescription)
    }
}
