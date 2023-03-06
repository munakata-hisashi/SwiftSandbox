//
//  File.swift
//  
//
//  Created by h_munakata on 2023/03/06.
//

import Foundation

@dynamicMemberLookup struct Lens<T> {
    var value: T
    subscript<U>(dynamicMember keyPath: WritableKeyPath<T, U>) -> U {
        return value[keyPath: keyPath]
    }
}

struct Point {
    var x, y: Double
}

struct Rectangle {
    var topLeft, bottomRight: Point
}
