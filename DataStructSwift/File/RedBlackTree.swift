//
//  RedBlackTree.swift
//  DataStructSwift
//
//  Created by xumin on 2022/10/9.
//

import Foundation
/**
 红黑树的规则：除了是二叉树外，还有5个特性
 1，节点是红色或者黑色
 2，根节点是黑色
 3，每个叶子节点都是黑色的空节点
 4，每个红色节点的两个子节点都是黑色(从每个叶子节点到根的所有路径上不能有两个连续的红色节点)
 5，从任一节点到其叶子节点的所有路径都包含相同数目的黑色节点
 
 上面的约束，确保了红黑树的关键特性：
    从根到叶子的最长可能路径，不会超过最短可能路径的两倍长，结果就是这个树基本是平衡的
 
 插入节点的时候，有可能树不再平更了，可以通过三种方式的变换，让树保持平衡
 1,变色，2，左旋转，3，右旋转
 变色：
    为了插入节点后能重新符合红黑树的规则，需要把红色节点变成黑色，或者把黑色节点变成红色
    
    首先需要知道插入的新节点通常都是红色节点，原因如下：
    a:因为在插入节点为红色的时候，有可能插入一次是不违反红黑树任何规则的，
    b:而插入黑色节点，必然会导致有一条路径上多了黑色节点，这是很难调整的
    c:红色节点可能导致出现红红相连的情况，但是这种可以通过颜色调换和旋转来调整
 */

/**
 为了方便红黑树的操作，给一些节点规定一些名称，
 设要插入的节点为N，其父节点为P，祖父节点为G，父节点的兄弟节点为U

    插入节点的5种情况
    1，新节点N位于树根上，没有父节点
    这种情况直接将新节点从红变黑即可
 
    2，新节点的N的父节点P是黑色，且父节点P是二叉树的叶子节点
    这种情况直接插入节点即可
 
    3，父节点P是红色，叔节点U是红色，祖父节点G是黑色
    这种情况将 父节点P，叔节点U 变黑，祖父节点G变红
    可能出现的问题：
        祖父节点G的父节点也是红色，这就需要递归调整颜色了，如果调整颜色到了根节点，就需要进行旋转操作了
 
 */

/**
    红黑树和4阶B树（2-3-4）具有等价性
    黑色节点和它的红色子节点融合在一起，形成一个B树节点，如果黑色节点没有红色子节点，就独立成一个B树节点
    红黑树的黑色节点个数与4阶B树的节点总个数相等
 */

enum RedBlack{
    case red
    case black
}
///红黑树的节点
class RBNode<Element> where Element:Comparable{
    var value:Element
    var left:RBNode?
    var right:RBNode?
    var Color:RedBlack = .red
    init(_ value:Element) {
        self.value = value
        self.left = nil
        self.right = nil
        self.Color = .red
    }
}
extension RBNode:CustomStringConvertible{
    var description: String{
        return "\(value)"
    }
}
///红黑树
class RBTree<Element> where Element:Comparable{
    var root:RBNode<Element>?
    ///修改颜色
    func changeColor(_ node:RBNode<Element>,_ color:RedBlack) -> RBNode<Element>{
        node.Color = color
        return node
    }
    ///修改成红色
    func ChangeRedColor(_ node:RBNode<Element>) -> RBNode<Element>{
        return changeColor(node, .red)
    }
    ///修改成黑色
    func ChangeBlackColor(_ node:RBNode<Element>) -> RBNode<Element>{
        return changeColor(node, .black)
    }
    ///返回节点颜色
    func colorOf(_ node:RBNode<Element>?) -> RedBlack{
        guard node?.value != nil else {
            return .black //空节点就是黑色
        }
        return node!.Color
    }
    ///是不是红色
    func isRed(_ node:RBNode<Element>?) -> Bool{
        return colorOf(node) == .red
    }
    ///是不是黑色
    func isBlack(_ node:RBNode<Element>?) -> Bool{
        return colorOf(node) == .black
    }
}



















