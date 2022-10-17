//
//  PriorityQueue.swift
//  DataStructSwift
//
//  Created by xumin on 2022/10/17.
//

import Foundation
///优先级的枚举
enum PriorityLevel{
    case normal
    case high
    case mid
    case low
    var level:Int{
        switch self {
        case .normal:
            return 3
        case .high:
            return 4
        case .mid:
            return 2
        case .low:
            return 1
        }
    }
}
class QueueElement<Element>{
    //数据
    var ele:Element
    //优先级
    var priority:PriorityLevel = .normal
    init(_ element:Element,_ priority:PriorityLevel) {
        self.ele = element
        self.priority = priority
    }
}
extension QueueElement:CustomStringConvertible{
    var description: String{
        return "\(self.ele)"
    }
}
///优先级队列
class PriorityQueue<Element>{
    
    private var items:[QueueElement<Element>] = []
    ///队列是否是空
    var isEmpty:Bool{
        return items.isEmpty
    }
    ///返回队头元素
    var peek:QueueElement<Element>?{
        return items.first
    }
    ///返回队尾元素
    var tail:QueueElement<Element>?{
        return items.last
    }
    ///队列长度
    var size:Int{
        return items.count
    }
}
extension PriorityQueue:CustomStringConvertible{
    var description: String{
        return items.map { "\($0)"}.joined(separator: "<-")
    }
}
extension PriorityQueue{
    ///入队
    func enQueue(_ ele:Element,_ priority:PriorityLevel){
        let qe = QueueElement.init(ele, priority)
        if items.count == 0 {
            items.append(qe)
        }else{
            //标记下标
            var i = 0
            //标记是否插入了。
            var isInsert = false
            for item in items {
                //一个一个的比较优先级
                if item.priority.level < qe.priority.level {
                    items.insert(qe, at: i)
                    isInsert = true
                    break
                }
                i += 1
            }
            //比较到了最后，优先级比队列中的都小，直接在数组末尾插入
            if !isInsert {
                items.append(qe)
            }
        }
    }
    ///出队
    func deQueue() -> QueueElement<Element>?{
        if isEmpty {
            return nil
        }
        return items.removeFirst()
    }
}
