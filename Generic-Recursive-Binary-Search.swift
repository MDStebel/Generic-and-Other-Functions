import Foundation

func binarySearch<T: Comparable>(in collection: [T], for key: T, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound {
        // If we get here, then the search key is not present in the array.
        return nil
        
    } else {
        // Calculate where to split the array.
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        
        // Is the search key in the left half?
        if collection[midIndex] > key {
            return binarySearch(in: collection, for: key, range: range.lowerBound ..< midIndex)
            
        // Is the search key in the right half?
        } else if collection[midIndex] < key {
            return binarySearch(in: collection, for: key, range: midIndex + 1 ..< range.upperBound)
            
        // If we get here, then we've found the search key!
        } else {
            return midIndex
        }
    }
}


/// Test it

// Initialize an array of integers
let numbers = (1...100000).map {$0}
let averageInterations = Int(log2(Double(numbers.last!)))

if let found = binarySearch(in: numbers, for: 500, range: 0..<numbers.count) {
    print("Found at \(found)")
}
