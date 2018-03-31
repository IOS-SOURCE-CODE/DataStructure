//: Playground - noun: a place where people can play

import Foundation

public struct Queue<T> {
   private var data = [T]()
   
   public init() {}
   
   public init<S: Sequence>(_ s: S) where S.Iterator.Element == T {
      self.data.append(contentsOf: s)
   }
   
   public mutating func dequeue() -> T? {
      return data.removeFirst()
   }
   
   public func peek() -> T? {
      return data.first
   }
   
   
   public mutating func enqueue(elemenet: T) {
      data.append(elemenet)
   }
   
   public mutating func clear() {
      data.removeAll()
   }
   
   public var count: Int {
      return data.count
   }
   
   public var capacity: Int {
      get {
         return data.capacity
      }
      
      set {
         data.reserveCapacity(newValue)
      }
   }
   
   public func isFull() -> Bool {
      return count == data.capacity
   }
   
   public func isEmpty() -> Bool {
      return data.isEmpty
   }
   
   
   private func checkIndex(index:Int) {
      if index < 0 || index > count {
         fatalError("Index out of range")
      }
   }
}


// Printable


extension Queue: CustomStringConvertible, CustomDebugStringConvertible {
   public var description: String {
      return data.description
   }
   
   public var debugDescription: String {
      return data.debugDescription
   }
}


// Convert to array

extension Queue: ExpressibleByArrayLiteral {
   public init(arrayLiteral elements: T...) {
      self.init(elements)
   }
}


// for..in
extension Queue: Sequence {
   public func makeIterator() -> AnyIterator<T> {
      return AnyIterator(IndexingIterator(_elements: data.lazy))
   }
}


// Subscript

extension Queue: MutableCollection {
   public var startIndex: Int {
      return 0
   }
   
   public var endIndex: Int {
      return count - 1
   }
   
   public func index(after i: Int) -> Int {
      return data.index(after: i)
   }
   
   public subscript(index: Int) -> T {
      get {
         checkIndex(index: index)
         return data[index]
      }
      
      set {
         checkIndex(index: index)
         data[index] = newValue
      }
   }
}


var queue = Queue<Int>()

queue.enqueue(elemenet: 100)
queue.enqueue(elemenet: 120)
queue.enqueue(elemenet: 125)
queue.enqueue(elemenet: 130)


let x = queue.dequeue()

let y = queue.peek()

let z = queue.dequeue()


var q1: Queue<Int> = [1,2,3,4,5]

var q2 = Queue<Int>(q1)

let q1x = q1.dequeue()

q2.enqueue(elemenet: 55)


for el in q1 {
   print(el)
}

q2[1]
q2.index(after: 1)















