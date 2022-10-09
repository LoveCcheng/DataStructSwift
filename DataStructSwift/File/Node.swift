//
//  Node.swift
//  SwiftData
//
//  Created by xumin on 2022/9/22.
//

import Foundation
import AppKit
///节点
class Node<Element>{
    var value:Element
    var next:Node?
    init(value:Element,next:Node? = nil) {
        self.value = value
        self.next = next
    }
}
///打印节点的值
extension Node:CustomStringConvertible{
    var description: String {
        return "\(value)"
    }
}
///链表
class LinkList<Element>{
    var head:Node<Element>?
    var tail:Node<Element>?
    init() {}
    var isEmpty:Bool{
        return head == nil
    }
    var LinkCount:Int = 0
}

extension LinkList:CustomStringConvertible{
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
///链表插入的基本操作
/**
    1,push,在列表前面添加一个值
 2，append,在链表末尾添加一个值
 3，insert(after:),在特定的节点之后添加一个值
 */
extension LinkList{
    ///头结点插入
    func push(value:Element){
        head = Node(value: value, next: head)
        if tail == nil {//如果我们要插入的是一个空列表，则新节点既是列表的头部也是尾部。
            tail = head
            LinkCount += 1
        }
    }
    ///尾节点插入
    func append(value:Element){
        let node = Node(value: value)
        //尾节点是空的，表示是空表
        if tail == nil {
            tail = node
            head = tail
        }else{//不是空
            tail?.next = node
            tail = tail?.next
        }
        LinkCount += 1
    }
    ///在特定的节点之后添加一个值
    func insert(value:Element,after:Int){
        guard after >= 0 else {
            return
        }
        guard after <= LinkCount else {
            return
        }
        guard let node = node(at: after) else { return }
        let newNode = Node(value: value)
        newNode.next = node.next
        node.next = newNode
    }
    ///根据索引找到特定的节点
    func node(at index:Int) -> Node<Element>?{
        //如果索引小于0 ，就直接返回Nil
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
///删除节点的操作
extension LinkList{
    ///删除头结点
    @discardableResult
    func pop() -> Element?{
        head = head?.next
        if isEmpty { //删除后如果列表为空，则tail = nil
            tail = nil
        }
        return head?.value
    }
    ///删除尾节点
    ///@discardableResult
    func removeLast() -> Element?{
        ///头结点是空，表示链表空
        guard let head = self.head else { return nil }
        guard head.next != nil else {
            //如果head.next为nil,则就只有一个节点
            return pop()
        }
        //定义两个指针,循环往下找
        var pre = head
        var current = head
        while let next = current.next {
            pre = current
            current = next
        }
        pre.next = nil
        tail = pre
        return current.value
    }
    ///删除链表任意位置的节点
    func remove(at index:Int) -> Element?{
        ///找到位置上的节点
        let node = node(at: index)
        guard let n = node else {
            return nil
        }
        let current = n
        //删除这个节点，只需要做到让n节点的上一个节点指向下一个节点即可，但是由于是单向链表，不知道上一个节点，所以只要把n节点下一个节点覆盖掉当前的n节点即可
        if let next = n.next {
            //如果有下一个节点
            n.value = next.value
            n.next = next.next
            return current.value
        }else{
            //没有下一个节点，表示当前节点是最后一个节点
            let n1 = removeLast()
            return n1
        }
    }
}

