//
//  CirculaQueue.swift
//  DataStructSwift
//
//  Created by xumin on 2022/10/4.
//

import Foundation
//循环队列,只是在逻辑上将顺序队列臆造成一个环状的空间，实际上还是一个顺序表

class CircularQueue{
    private var size:Int = 0 //空间大小
    private var count:Int = 0 //队列长度
    private var front:Int = 0 //头
    private var rear:Int = 0  //尾
    private var data:[Int] = [] //实际数据
    ///初始化循环队列的大小
    init(_ s:Int) {
        size = s
        data = Array(repeating: 0, count: s)
    }
    ///入队操作
    @discardableResult
    func enQueue(_ value:Int) -> Bool{
        guard !isFull() else {
            print("队列满了")
            return false
        }
        data[rear] = value
        rear = (rear + 1) % size //rear指向下一个位置
        count += 1
        return true
    }
    ///出队操作
    @discardableResult
    func deQueue() -> Bool{
        guard !isEmpty() else {
            return false
        }
        data[front] = 0
        front = (front + 1) % size //front指向下一个位置
        count -= 1
        return true
    }
    ///是不是空队列
    @discardableResult
    func isEmpty() -> Bool{
        return count == 0
    }
    ///是不是队满
    @discardableResult
    func isFull() -> Bool{
        return count == size
    }
    ///队列长度
    func queueCount() -> Int{
        return count
    }
    ///队头元素
    var frontValue:Int{
        guard !isEmpty() else {
            return -1
        }
        return data[front]
    }
    ///队尾元素
    var rearValue:Int{
        guard !isEmpty() else {
            return -1
        }
        return data[rear-1]
    }
}

extension CircularQueue:CustomStringConvertible{
    var description: String{
        return data.map {
            "\($0)"
        }.joined(separator: "<-")
    }
}
