//
//  File.swift
//  
//
//  Created by h_munakata on 2023/03/29.
//

import Foundation

struct A: Sendable {} let a = A()

// error: marker protocol 'Sendable' cannot be used in a conditional cast
print(a as? Sendable)
// error: marker protocol 'Sendable' cannot be used in a conditional cast
