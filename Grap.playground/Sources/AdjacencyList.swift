import Foundation

public struct VertexEdgesList<T: Equatable & Hashable> {
   
   public let vertex: Vertex<T>
   public var edges: [Edge<T>] = []
   
   public init(vertex: Vertex<T>) {
      self.vertex = vertex
   }
   
   public mutating func addEdge(edge: Edge<T>) {
      if self.edges.count > 0 {
         let equalEdges  = self.edges.filter() { existingEdge in
            return existingEdge == edge
         }
         if equalEdges.count > 0 {
            return
         }
      }
      self.edges.append(edge)
   }
   
}
