//: ## Computing Pi as the Probability of any two numbers being relatively prime (i.e., coprime)
//: ### Uses Euclid's Algorithm
import UIKit
let equation = #imageLiteral(resourceName: "Screen Shot 2021-03-17 at 2.06.05 PM.png")

// Wrapper for recursive GCD function to find Greatest Common Divisor of two integers
func gcd(a: Int, b: Int) -> Int {
    
    // Recursive GCD
    /// Uses Euler's method
    /// - Parameters:
    ///   - a: The first number
    ///   - b: The second number
    /// - Returns: The greatest common divisor
    func gcdRecursive(a: Int, b: Int) -> Int {
        return b == 0 ? a : gcdRecursive(a: b, b: a % b)
    }
    
    var a1 = abs(a)
    var b1 = abs(b)
    if (b1 > a1) { swap(&a1, &b1) }
    
    return gcdRecursive(a: a1, b: b1)
    
}


// Compute pi Usiing Euler's Method
// Where copprimes/total = 6 / pi^2

var randoms = [Int]()
for _ in 0..<50000 {
    randoms.append(Int.random(in: 1..<250000))
}

var coprimeCount = 0
var totalCount   = 0
var index        = 0
var piSoFar      = 0.0

for _ in 0..<randoms.count / 2 {
    let a = randoms[index]
    let b = randoms[index + 1]
    if gcd(a: a, b: b) == 1 {
        coprimeCount += 1
    }
    piSoFar = sqrt(6 * Double(totalCount) / Double(coprimeCount))
    totalCount += 1
    index += 2
}

let piFinal = piSoFar
