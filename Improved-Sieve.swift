import Foundation

// Function to compute all the primes up to n and return in an array
func sieve(n: Int) -> [Bool] {
    // Handle trivial cases
    guard n > 1 else {
        return []
    }

    // Initialize all to true, then mark 0 and 1 as not prime
    var isPrime = [Bool](repeating: true, count: n)
    isPrime[0] = false
    isPrime[1] = false

    // Only need to iterate up to the square root of n
    let limit = Int(Double(n).squareRoot())

    for i in 2...limit {
        // If i is not prime, skip
        guard isPrime[i] else { continue }

        // Start crossing out from i*i in steps of i
        for multiple in stride(from: i*i, to: n, by: i) {
            isPrime[multiple] = false
        }
    }

    return isPrime
}

let primes = sieve(n: 1000000)
for n in 2..<primes.count where primes[n] == true {
    print(n)
}
