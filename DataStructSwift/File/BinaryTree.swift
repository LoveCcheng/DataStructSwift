//
//  BinaryTree.swift
//  DataStructSwift
//
//  Created by xumin on 2022/10/7.
//

import Foundation

///树的节点
class TreeNode<Element> where Element:Comparable{
    var value:Element
    var left:TreeNode?
    var right:TreeNode?
    init(_ value:Element) {
        self.value = value
        self.left = nil
        self.right = nil
    }
}
extension TreeNode:CustomStringConvertible{
    var description: String{
        return "\(value)"
    }
}
//常见方法
/**
1,插入
2,查找
3,遍历
4，删除
 */
class BinarySearchTree<Element> where Element:Comparable{
    typealias handleFunc = (_ key:Element)->(Void)
    var root:TreeNode<Element>?
    ///插入方法
    func insert(_ value:Element){
        let node = TreeNode(value)
        //判断有没有根节点
        if root == nil {
            root = node //没有
        }else{//有
            insertNode(root!, node)
        }
    }
    ///插入节点
    private func insertNode(_ node:TreeNode<Element>,_ newNode:TreeNode<Element>){
        if newNode.value < node.value { //向左查找
            if node.left == nil { //说明左子树为空，可以直接插入
                node.left = newNode
            }else{//继续递归调用
                insertNode(node.left!, newNode)
            }
        }else{//向右查找
            if node.right == nil {  //说明右子树为空，可以直接插入
                node.right = newNode
            }else{ //继续递归调用
                insertNode(node.right!, newNode)
            }
        }
    }
}
///遍历
extension BinarySearchTree{
    ///先序遍历->先访问根节点
    ///1,访问根节点，2先序遍历左子树，3先序遍历右子树
    func preOrderTraverasl(_ handle:handleFunc){
        preOrderTraveraslNode(root, handle)
    }

    private func preOrderTraveraslNode(_ node:TreeNode<Element>?,_ handle:handleFunc){
        guard let newNode = node else { return }
        ///处理节点
        handle(newNode.value)
        ///遍历所有的左子树
        preOrderTraveraslNode(newNode.left,handle)
        ///遍历所有的右子树
        preOrderTraveraslNode(newNode.right,handle)
    }
    
    ///中序遍历->中间访问根节点
    func midOrderTraverasl(_ handle:handleFunc){
        midOrderTraveraslNode(root, handle)
    }
    ///1,访问左子树，2，处理节点，3，访问右子树
    private func midOrderTraveraslNode(_ node:TreeNode<Element>?,_ handle:handleFunc){
        guard let newNode = node else {
            return
        }
        ///遍历所有的左子树
        midOrderTraveraslNode(newNode.left,handle)
        ///处理节点
        handle(newNode.value)
        ///遍历所有的右子树
        midOrderTraveraslNode(newNode.right,handle)
    }
    
    ///后序遍历->最后访问根节点
    func postOrderTraverasl(_ handle:handleFunc){
        postOrderTraveraslNode(root, handle)
    }
    ///1,访问左子树，2，访问右子树,3，处理节点
    private func postOrderTraveraslNode(_ node:TreeNode<Element>?,_ handle:handleFunc){
        guard let newNode = node else {
            return
        }
        ///遍历所有的左子树
        postOrderTraveraslNode(newNode.left,handle)
        ///遍历所有的右子树
        postOrderTraveraslNode(newNode.right,handle)
        ///处理节点
        handle(newNode.value)
    }
}

///最大最小值
extension BinarySearchTree{
    ///最小值
    var min:Element{
        var node = root
        while node!.left != nil {
            node = node!.left
        }
        return node!.value
    }
    ///最大值
    var max:Element{
        var node = root
        while node!.right != nil {
            node = node!.right
        }
        return node!.value
    }
}
//搜索
extension BinarySearchTree{
    ///通过值来搜索节点是否存在
    func search(_ value:Element) -> TreeNode<Element>?{
        //return searchNode(root, value)
        return searchNodeMethodByCrcyle(value)
    }
    ///使用递归搜索
    private func searchNode(_ node:TreeNode<Element>?,_ value:Element) -> TreeNode<Element>?{
        guard let newNode = node else {
            return nil
        }
        if value > newNode.value {
           return searchNode(newNode.right, value)
        }else if value < newNode.value {
            return searchNode(newNode.left, value)
        }else{//找到了
            return newNode
        }
    }
    ///使用循环搜索
    private func searchNodeMethodByCrcyle(_ value:Element) -> TreeNode<Element>?{
        var node = root
        while node?.value != nil {
            if value < node!.value {
                node = node?.left
            }else if value > node!.value{
                node = node?.right
            }else{
                print("循环结束了222")
                return node
            }
        }
        print("循环结束了")
        //如果循环完了，还没有找到，就返回nil
        return nil
    }
}
///删除操作
///有多种情况，1,要删除的是叶子节点(没有子节点了)，2,要删除的节点有一个子节点，3.要删除的节点有两个子节点
extension BinarySearchTree{
    func remove(_ value:Element) -> Bool{
        //当前节点
        var currentNode = root
        //父节点
        var parentNode:TreeNode<Element>? = nil
        //是否是左子节点
        var isLeftChild = false
        ///如果相等就退出循环
        while currentNode?.value != value {
            parentNode = currentNode
            if value > currentNode!.value { //往右子树找
                isLeftChild = false
                currentNode = currentNode?.right
            }else{ //往左子树找
                isLeftChild = true
                currentNode = currentNode?.left
            }
            if currentNode?.value == nil {//表示找到最底部了，都没有找到，直接返回
                return false
            }
        }
        //到这里就表示currentNode?.value == value 找到了value对应的节点
        //1,要删除的是叶子节点(没有子节点了),判断就是左右子树都是nil
        if currentNode?.left == nil && currentNode?.right == nil {
            if currentNode === root {//只有一个根节点，
                root = nil
            }else if isLeftChild {
                parentNode?.left = nil
            }else {
                parentNode?.right = nil
            }
        }
        //2,要删除的节点有一个子节点
        //2.1,要删除的节点有一个右子节点
        else if currentNode?.left == nil{
            if currentNode === root {
                root = currentNode?.right
            }
            else if isLeftChild {
                parentNode?.left = currentNode?.right
            }else{
                parentNode?.right = currentNode?.right
            }
            currentNode = nil
        }
        //2.1,要删除的节点有一个左子节点
        else if currentNode?.right == nil{
            if currentNode === root {
                root = currentNode?.left
            }
            else if isLeftChild {
                parentNode?.left = currentNode?.left
            }else{
                parentNode?.right = currentNode?.left
            }
            currentNode = nil
        }
        //3,要删除的节点有两个子节点
        else{
            //后继替换
            
            //后继节点的父节点
            var successorParentNode = currentNode!
            //3.1获取后继节点
            let successorNode = getSuccessor(currentNode!, &successorParentNode)

            //判断后继节点是否是要删除节点的直接右子节点
            if successorNode.value != currentNode?.right?.value {
                successorParentNode.left = successorNode.right
                successorNode.right = currentNode?.right
            }
            //3.2判断是不是根节点
            if currentNode === root {
                root = successorNode
            }else if isLeftChild{//如果是左子树
                parentNode?.left = successorNode
            }else{//如果是右子树
                parentNode?.right = successorNode
            }
            successorNode.left = currentNode?.left
            //前驱替换
            //前驱节点的父节点
//            var precursorParentNode = currentNode!
//            let precursorNode = getPrecursor(currentNode!,&precursorParentNode)
//
//            //判断前驱节点是否是要删除节点的直接左子节点
//            if precursorNode.value != currentNode?.left?.value {
//                precursorParentNode.right = precursorNode.left
//                precursorNode.right = currentNode?.right
//            }
//            //判断是不是根节点
//            if currentNode === root {
//                root = precursorNode
//            }else if isLeftChild{
//                parentNode?.left = precursorNode
//            }else{
//                parentNode?.right = precursorNode
//            }
//            precursorNode.left = currentNode?.left
        }
        return true
    }
    //要删除的节点有两个子节点 ，或者说子节点下面还有子节点，这种情况下需要从下面的子节点中找到一个节点类替换当前节点。这个节点的值应该比删除的节点值小一点点，或者大一点点。
    //小一点点的节点，一定是要删除节点左子树的最大值
    //大一点点的节点，一定是要删除节点右子树的最小值
    //在二叉搜索树里面，比当前节点小一点点的节点称之为当前节点的前驱节点，
    //在二叉搜索树里面，比当前节点大一点点的节点称之为当前节点的后继节点，
    //使用前驱节点和后继节点都可以替换要删除的节点
    
    /// 寻找后继节点
    /// - Parameters:
    ///   - removeNode:  要删除的节点
    ///   - parentNode: 后继节点的父节点
    /// - Returns:后继节点
    private func getSuccessor(_ removeNode:TreeNode<Element>,_ parentNode:inout TreeNode<Element>) -> TreeNode<Element>{
        //保存找到的后继节点
        var successorNode = removeNode
        //要删除的节点的右子节点
        var currentNode = removeNode.right

        while currentNode?.value != nil {
            parentNode = successorNode
            successorNode = currentNode!
            currentNode = currentNode?.left
        }
        return successorNode
    }
    
    /// 寻找前驱节点
    /// - Parameter removeNode: 要删除的节点
    /// - Returns: 前驱节点
    private func getPrecursor(_ removeNode:TreeNode<Element>,_ parentNode:inout TreeNode<Element>) -> TreeNode<Element>{
        //保存找到的前驱节点
        var precursorNode = removeNode
        //要删除的节点的左子节点
        var currentNode = removeNode.left
        
        while currentNode?.value != nil {
            parentNode = precursorNode
            precursorNode = currentNode!
            currentNode = currentNode?.right
        }
        return precursorNode
    }
}
