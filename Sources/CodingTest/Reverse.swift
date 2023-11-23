import Foundation

enum SampleReverse {
    /// O(n)
    static func reverse(_ str: String) -> String {
        var reversed: [Character] = []
        for c in str {
            reversed.insert(c, at: 0)
        }
        return String(reversed)
    }
    
    /// O(n/2)
    static func reverse2(_ str: String) -> String {
        let count = str.count
        var array = Array(str)
        for i in 0..<count / 2 {
            let k = count - i - 1
            let tmp = array[i]
            array[i] = array[k]
            array[k] = tmp
        }
        return String(array)
    }
}
