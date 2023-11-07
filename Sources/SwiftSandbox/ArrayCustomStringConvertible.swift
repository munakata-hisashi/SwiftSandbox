
import Foundation

/*
 以下を実行したとき
 let users = [User(name: "hoge"), User(name: "fuga")]
 print(users.description)
 
 CustomStringConvertibleを実装していないと、
 [SwiftSandbox.User(name: "hoge"), SwiftSandbox.User(name: "fuga")]
 CustomStringConvertibleを実装していると、
 [hoge, fuga]
 */
struct User {
    let name: String
}

extension User: CustomStringConvertible {
    var description: String {
        name
    }
}


// CustomDebugStringConvertibleのほうが優先されるようだ
extension User: CustomDebugStringConvertible {
    var debugDescription: String {
        name + "debug"
    }
}
