// Generic stack implementation.

/// Just a simple generic stack. Works with data of any type
public struct Stack<T> {
  fileprivate var array = [T]()

  public var count: Int {
    return array.count
  }

  public var isEmpty: Bool {
    return array.isEmpty
  }

  public mutating func push(_ element: T) {
    array.append(element)
  }

  public mutating func pop() -> T? {
    return array.popLast()
  }

  public var top: T? {
    return array.last
  }
}


// Test examples
var stackInts = Stack<Int>()
stackInts.push(1)
stackInts.push(2)
stackInts.push(3)

print("pop: \(stackInts.pop())")
print("pop: \(stackInts.pop())")
