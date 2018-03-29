//: Playground - noun: a place where people can play

import UIKit

public enum RedBlackTreeColor: Int {
    case red = 0
    case black = 1
}

public class RedBlackTreeNode<T:Comparable> {
    
    //Value and childred-parent vars
    public var value: T
    public var leftChild: RedBlackTreeNode?
    public var rightChild: RedBlackTreeNode?
    public weak var parent: RedBlackTreeNode?
    
    // Color value
    public var color: RedBlackTreeColor
    
    public convenience init(value: T) {
        self.init(value: value, left: nil, right: nil, parent: nil, color: .black)
    }
    
    public init(value:T, left: RedBlackTreeNode?, right: RedBlackTreeNode?, parent: RedBlackTreeNode?, color: RedBlackTreeColor) {
        
        self.value = value
        self.color = color
        self.leftChild = left
        self.rightChild = right
        self.color = color
        self.parent = parent
        
    }
    
    // MARK: Helper methods
    public func grandParentNode() -> RedBlackTreeNode? {
        guard let grandParentNode = self.parent?.parent else { return nil }
        return grandParentNode
    }
    
    // Returns the "uncle" of the node, or nil if dones't exit.
    // This is the sibling of its parent node
    public func uncleNode() -> RedBlackTreeNode? {
        guard let grandParent = self.grandParentNode() else { return nil }
        if parent === grandParent.leftChild {
            return grandParent.rightChild
        } else {
            return grandParent.leftChild
        }
    }
    
    // Prints each layer of the tree from top to bottom with the node value
    // and the color
    public static func printTree(nodes: [RedBlackTreeNode]) {
        var childred: [RedBlackTreeNode] = Array()
        for node: RedBlackTreeNode in nodes {
            print("\(node.value) \(node.color)")
            if let leftChild = node.leftChild {
                childred.append(leftChild)
            }
            if let rightChild = node.rightChild {
                childred.append(rightChild)
            }
        }
        
        if childred.count > 0 {
            printTree(nodes: childred)
        }
    }
}


var redBlackTreeDemos = [RedBlackTreeNode(value: 10)]
redBlackTreeDemos.append(RedBlackTreeNode(value: 11))
redBlackTreeDemos.append(RedBlackTreeNode(value: 12))
redBlackTreeDemos.append(RedBlackTreeNode(value: 13))
redBlackTreeDemos.append(RedBlackTreeNode(value: 14))
redBlackTreeDemos.append(RedBlackTreeNode(value: 15))
RedBlackTreeNode.printTree(nodes: redBlackTreeDemos)







