//: Playground - noun: a place where people can play

public class BinaryTreeNode<T: Comparable> {
   
   public var value:T
   public var leftChild:BinaryTreeNode?
   public var rightChild:BinaryTreeNode?
   public weak var parent: BinaryTreeNode?
   
   public convenience init(value: T) {
      self.init(value: value, leftChild: nil, rightChild: nil, parent: nil)
   }
   
   public init(value:T, leftChild:BinaryTreeNode?, rightChild:BinaryTreeNode?, parent:BinaryTreeNode?) {
      self.value = value
      self.leftChild = leftChild
      self.rightChild = rightChild
      self.parent = parent
   }
   
   public func insertNodeFromRoot(value:T) {
      if let _ = self.parent {
         print("You can only add new nodes from the root node of the tree")
         return
      }
      self.addNode(value:value)
   }
   
   private func addNode(value:T) {
      if value < self.value {
         if let leftChild = leftChild {
            leftChild.addNode(value: value)
         } else {
            let newNode = BinaryTreeNode(value: value)
            newNode.parent = self
            leftChild = newNode
         }
      } else {
         if let rightChild = rightChild {
            rightChild.addNode(value:value)
         } else {
            let newNode = BinaryTreeNode(value: value)
            newNode.parent = self
            rightChild = newNode
         }
      }
   }
   
   public class func traverseInOrder(node:BinaryTreeNode?) {
      guard let node = node else {
         return
      }
      
      BinaryTreeNode.traverseInOrder(node: node.leftChild)
      print(node.value)
      
      BinaryTreeNode.traverseInOrder(node: node.rightChild)
      
   }
   
   public class func traversePreOrder(node:BinaryTreeNode?) {
      guard let node = node else {
         return
      }
      
      print(node.value)
      BinaryTreeNode.traversePreOrder(node: node.leftChild)
      BinaryTreeNode.traversePreOrder(node: node.rightChild)
      
   }
   
}




let rootNode = BinaryTreeNode(value: 10)
rootNode.insertNodeFromRoot(value: 20)
rootNode.insertNodeFromRoot(value: 5)
rootNode.insertNodeFromRoot(value: 21)
rootNode.insertNodeFromRoot(value: 8)
rootNode.insertNodeFromRoot(value: 4)



BinaryTreeNode.traverseInOrder(node: rootNode)
BinaryTreeNode.traversePreOrder(node: rootNode)

















