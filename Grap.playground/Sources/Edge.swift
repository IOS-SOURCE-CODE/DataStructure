
import Foundation

public struct Edge<T: Equatable>: Equatable {
   public let from: Vertex<T>
   public let to: Vertex<T>
}

public func == <T: Equatable> (lhs: Edge<T>, rhs: Edge<T>) -> Bool {
   guard lhs.from == rhs.from else {
      return false
   }
   
   guard lhs.to == rhs.to else {
      return false
   }
   
   return true
}








