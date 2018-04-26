import Foundation

// Recursive generic binary search
func binarySearch<T: Comparable>(a: [T], key: T, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound {
        // If we get here, then the search key is not present in the array.
        return nil
        
    } else {
            // Calculate where to split the array.
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        
            // Is the search key in the left half?
        if a[midIndex] > key {
            return binarySearch(a: a, key: key, range: range.lowerBound ..< midIndex)
            
            // Is the search key in the right half?
        } else if a[midIndex] < key {
            return binarySearch(a: a, key: key, range: midIndex + 1 ..< range.upperBound)
            
            // If we get here, then we've found the search key!
        } else {
            return midIndex
        }
    }
}


// Test examples
let numbers = (1...1000000).map {$0}    // Initialize an array of integers
let averageInterations = Int(log2(Double(numbers.last!)))

if let found = binarySearch(a: numbers, key: 16, range: 0..<numbers.count) {
    print("Found")
}
