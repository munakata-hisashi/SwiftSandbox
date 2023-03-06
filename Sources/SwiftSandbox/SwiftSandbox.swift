@main
public struct SwiftSandbox {
    public private(set) var text = "Hello, World!"

    public static func main() {
        let lensRectangle = Lens(value: Rectangle(topLeft: Point(x: 10, y: 10), bottomRight: Point(x: 20, y: 20)))
        print(lensRectangle.bottomRight) // Point(x: 20, y: 20) LensのプロパティかのようにPointのtopLeftプロパティにアクセス
        print(lensRectangle[keyPath: \.bottomRight])
    }
}
