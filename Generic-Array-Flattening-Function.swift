//: # Generic Flatten a Nested Array
//: Using recursion
import UIKit

// [1] -> [1]
// [1, 2, 3] -> [1, 2, 3]
// [1, [2]] -> [1, 2]
// [1, [2, 3]] -> [1, 2, 3]
// [1, [2, [3, 4]]] -> [1, 2, 3, 4]
// [1, [2, [3, [4, 6]]]] -> [1, 2, 3, 4, 6]
// ["Hi", ["There", ["Michael", "David"], "Stebel"]] -> ["Hi", "There", "Michael", "David", "Stebel"]
// [2.1, Double.pi, [Double.pi / 2.0, -33.33]] -> [2.1000000000000001, 3.1415926535897931, 1.5707963267948966, -33.329999999999998]

func flatten<T: Comparable>(nested array: [Any]) -> [T] {
    var myFlattenedArray = [T]()
    for element in array {
        if element is T {
            myFlattenedArray.append(element as! T)
        } else if element is [Any] {
            let recursionResult: [T] = flatten(nested: element as! [Any])
            for entry in recursionResult {
                myFlattenedArray.append(entry)
            }
        }
    }
    return myFlattenedArray
}

// Test examples
var result: [Int] = flatten(nested: [1, [2, -55], 3]).sorted()
print("Result:", result)
var resultString: [String] = flatten(nested: ["Hi", ["There", ["Michael", "David"], "Stebel"]])
print("Result:", resultString)
var resultDouble: [Double] = flatten(nested: [2.1, Double.pi, [Double.pi / 2.0, -33.33]])
print("Result:", resultDouble)
