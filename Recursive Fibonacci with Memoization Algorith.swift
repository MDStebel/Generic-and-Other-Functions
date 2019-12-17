//
//  Recursive Fibonacci with Memoization Algorith.swift
//  
//
//  Created by Michael Stebel on 12/17/19.
//

import Foundation

/// Using caching algorithm called Memoization
func fibonacci(ofOrder a: Int) -> Int64? {
    let max = 92
    guard (0...max ~= a) && a >= 0 else { return nil } // Using pattern matching operator to check range of a
    
    var cachedFibs = [Int64](repeating: 0, count: max+1)
    
    func recursiveFib(ofOrder a: Int) -> Int64 {
        var value: Int64 = 0
        if cachedFibs[a] > 0 {
            return cachedFibs[a]
        }
        if a <= 2 {
            value = 1
        } else {
            value = recursiveFib(ofOrder: a - 1) + recursiveFib(ofOrder: a - 2)
        }
        cachedFibs[a] = value
        return value
    }
    
    return recursiveFib(ofOrder: a)
    
}
