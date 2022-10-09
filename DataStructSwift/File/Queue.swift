//
//  Queue.swift
//  DataStructSwift
//
//  Created by xumin on 2022/9/30.
//

import Foundation
///简单队列
struct Queue<Element>{
    private var array:[Element] = []
    ///队列是否是空
    var isEmpty:Bool{
        return array.isEmpty
    }
    ///返回队头元素
    var peek:Element?{
        return array.first
    }
    ///返回队尾元素
    var tail:Element?{
        return array.last
    }
    ///队列长度
    var size:Int{
        return array.count
    }
    ///入队
    mutating func enQueue(value:Element){
        array.append(value)
    }
    ///出队
    mutating func deQueue() -> Element?{
        if isEmpty {
            return nil
        }
        return array.removeFirst()
    }
    
}
extension Queue:CustomStringConvertible{
    var description: String{
        /**
         map是将数组array元素转换到string,joined是在元素之间加上分隔符号
         */
        let result = array.map {
            "\($0)"
        }.joined(separator: "<-")
        return result
    }
}


