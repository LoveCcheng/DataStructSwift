//
//  main.swift
//  DataStructSwift
//
//  Created by xumin on 2022/9/30.
//

import Foundation


//let list = DoubleLinkList<Int>()
//list.push(value: 3)
//list.push(value: 5)
//list.push(value: 7)
//list.append(value: 19)
//list.append(value: 39)
//list.insert(value: 100, after: 0)
//list.append(value: 229)
//let a = [10,20,30]
//list.append(contentsOf: a)
//print("链表长度=\(list.size),数据\(list)")
//list.pop()
//print("链表长度=\(list.size),数据\(list)")
//list.remove(at: 1)
//print("链表长度=\(list.size),数据\(list)")
//list.removeLast()
//print("链表长度=\(list.size),数据\(list)")
//list.pop()
//print("链表长度=\(list.size),数据\(list)")

//var queue = Queue<Any>()
//queue.enQueue(value: 8)
//queue.enQueue(value: 18)
//queue.enQueue(value: 28)
//queue.enQueue(value: 38)
//print(queue)
//queue.deQueue()
//print(queue)
//print(queue.size)
//
//var arr:[Int] = Array(repeating: 0, count: 10)
//print(arr)


//var criQueue = CircularQueue(10)
//criQueue.enQueue(12)
//criQueue.enQueue(32)
//criQueue.enQueue(14)
//criQueue.enQueue(45)
//criQueue.enQueue(67)
//print(criQueue)
//criQueue.enQueue(89)
//criQueue.enQueue(123)
//print(criQueue)
//criQueue.deQueue()
//criQueue.deQueue()
//print(criQueue)
//print(criQueue.frontValue)
//print(criQueue.rearValue)
//criQueue.enQueue(111)
//print(criQueue)
//criQueue.enQueue(222)
//print(criQueue)
//criQueue.enQueue(900)
//print(criQueue)
//criQueue.enQueue(999)
//print(criQueue)
//criQueue.enQueue(200)
//print(criQueue)
//criQueue.enQueue(300)
//print(criQueue)
//criQueue.deQueue()
//print(criQueue)


//var ht = HashTable(10)
//ht.addValue(23)
//ht.addValue(100)
//ht.addValue(97)
//ht.addValue(56)
//ht.addValue(78)
//ht.addValue(14)
//ht.addValue(32)
//ht.addValue(83)
//ht.displayTable()
//let v = ht.hashTable[9]
//print(v)

let tree = BinarySearchTree<Int>()
tree.insert(34)
tree.insert(12)
tree.insert(23)
tree.insert(89)
tree.insert(100)
tree.insert(10)
tree.insert(93)
tree.insert(8)
tree.insert(16)
tree.insert(28)
tree.insert(88)
tree.insert(96)
tree.insert(102)
tree.insert(11)
tree.insert(20)
var str = ""
tree.preOrderTraverasl { key in
    str += "\(key)" + " "
}
print(str)
//
//str = ""
//tree.midOrderTraverasl { key in
//    str += "\(key)" + " "
//}
//print(str)
//
//str = ""
//tree.postOrderTraverasl { key in
//    str += "\(key)" + " "
//}
//print(str)
//
//print(tree.min)
//print(tree.max)

//let node = tree.search(12)
//if node?.value != nil{
//    print("找到了")
//}else{
//    print("没有找到哦")
//}
print(tree.remove(89))
str = ""
tree.preOrderTraverasl { key in
    str += "\(key)" + " "
}
print(str)
