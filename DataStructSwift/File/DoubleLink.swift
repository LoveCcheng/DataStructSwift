//
//  DoubleLink.swift
//  SwiftData
//
//  Created by xumin on 2022/9/29.
//

import Foundation

class DoubleNode<Element> {
    var value:Element
    var prev:DoubleNode?
    var next:DoubleNode?
    init(value:Element,prev:DoubleNode? = nil,next:DoubleNode? = nil){
        self.value = value
        self.prev = prev
        self.next = next
    }
}
extension DoubleNode:CustomStringConvertible{
    var description: String{
        return "\(value)"
    }
}

class DoubleLinkList<Element>{
    var size:Int = 0
    
    var head:DoubleNode<Element>?
    
    var tail:DoubleNode<Element>?{
        guard var node = head else {
            return nil
        }
        while let next = node.next {
            node = next
        }
        return node
    }
    init() {
        
    }
    ///是否是空表
    var isEmpty:Bool{
        return head == nil
    }
    ///是不是有效索引
    func indexVaild(index:Int) -> Bool{
        return index >= 0 && index < size
    }
}
extension DoubleLinkList:CustomStringConvertible{
    ///链表输出格式 -    A -> B -> C
    var description: String {
        var head = self.head
        var result:String = ""
        while head != nil{
            result += head?.description ?? ""
            head = head?.next
            if head != nil{
                result += "->"
            }
        }
        return result
    }
}
///插入操作
extension DoubleLinkList{
    //头插
    func push(value:Element){
        let node = DoubleNode(value: value)
        if let h = head {//头结点存在
            node.next = h
            h.prev = node
            head = node
        }else{//不存在
            head = node
        }
        size += 1
    }
    //尾插
    func append(value:Element){
        let node = DoubleNode(value: value)
        if let lastNode = tail {
            lastNode.next = node
            node.prev = lastNode
        }else{//表示是空表
            head = node
        }
        size += 1
    }
    ///尾插多个
    func append<S>(contentsOf newElement:S) where S:Sequence,Element == S.Element{
        for item in newElement {
            append(value: item)
        }
    }
    
    //中间插,插入到指定位置的后面
    func insert(value:Element,after:Int){
        guard indexVaild(index: after) else {
            print("索引错误")
            return
        }
        guard let node = nodeAt(index: after) else {
            return
        }
        let newNode = DoubleNode(value: value)
        newNode.next = node.next
        node.next?.prev = newNode
        node.next = newNode
        size += 1
    }
    ///得到某个节点
    private func nodeAt(index:Int) -> DoubleNode<Element>?{
        guard index >= 0 else {
            return nil
        }
        var i = index
        var node = head
        while node != nil{
            if i == 0 {
                return node
            }
            node = node?.next
            i = i-1
        }
        return node
    }
}

///删除操作
extension DoubleLinkList{
    ///删除索引位置的节点
    func remove(at index:Int) -> Element?{
        guard indexVaild(index: index) else {
            print("索引错误")
            return nil
        }
        let node = nodeAt(index: index)
        if index == 0 {
            head = head?.next
        }else if index == size - 1{
            tail?.prev?.next = nil
        }else{
            node?.prev?.next = node?.next
            node?.next?.prev = node?.prev
        }
        size -= 1
        return node?.value
    }
    
    ///删除头结点
    func pop() -> Element?{
        if isEmpty {
            return nil
        }
        return remove(at: 0)
    }
    ///删除尾节点
    func removeLast() -> Element?{
        if isEmpty{
            return nil
        }
        return remove(at: size-1)
    }
}


