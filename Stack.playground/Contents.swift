//: Playground - noun: a place where people can play

import Foundation


public struct Stack<T> {
   private var elements = [T]()
   
   public init(){}
   
   public init<S: Sequence >(_ s: S) where S.Iterator.Element == T {
      self.elements = Array(s)
   }
   
   public mutating func pop() -> T? {
      return self.elements.popLast()
   }
   
   public mutating func push(_ element: T) {
      self.elements.append(element)
   }
   
   public func peek() -> T? {
      return self.elements.last
   }
   
   public func isEmpty() -> Bool {
      return self.elements.isEmpty
   }
   
   public var count: Int {
      return self.elements.count
   }
   
}


extension Stack: CustomStringConvertible, CustomDebugStringConvertible {
   
   public var description: String {
      return self.elements.description
   }
   
   public var debugDescription:String {
      return self.elements.debugDescription
   }
}

// alow use backet notation []
extension Stack: ExpressibleByArrayLiteral {
   public init(arrayLiteral elements: T...) {
      self.init(elements)
   }
}


//extension Stack: Sequence {
//   public func makeIterator() -> ArrayLiterator<T> {
//      return ArrayLiterator<T>(elements: self.elements.reversed())
//   }
//
//}

extension Stack : Sequence {
   public func makeIterator() -> AnyIterator<T> {
      return AnyIterator<T>(IndexingIterator(_elements: self.elements.lazy.reversed()))
   }
}

// return iterator

public struct ArrayLiterator<T>: IteratorProtocol {
   
   var currentElement: [T]
   
   init(elements: [T]) {
      self.currentElement = elements
   }
   
   mutating public func next() -> T? {
      if (!self.currentElement.isEmpty) {
         return self.currentElement.popLast()
      }
      return nil
   }
   
}

// Behind the sceen of for..in
//var animalIterator = animals.makeIterator()
//while let animal = animalIterator.next() {
//   print(animal)
//}
// Prints "Antelope"
// Prints "Butterfly"
// Prints "Camel"
// Prints "Dolphin


var myStack = Stack<Int>()

myStack = [1,2,3,4]

var myStackFromStack = Stack<Int>(myStack)

myStack.push(5)
myStack.push(44)
myStack.push(23)

//var x = myStack.pop()
//x = myStack.pop()
//x = myStack.pop()
//x = myStack.pop()

print(myStack)




myStackFromStack.push(55)

for s in myStackFromStack {
   print(s)
}













