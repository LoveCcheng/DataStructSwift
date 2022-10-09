//
//  Stack.swift
//  SwiftData
//
//  Created by xumin on 2022/9/21.
//

import Foundation


public struct Stack<Element>{
    private var storage:[Element] = []
    //结构体里面，函数操作变量需要加上mutating关键字
    ///入栈
    mutating func push(_ element:Element){
        storage.append(element)
    }
    ///出栈
    @discardableResult
    mutating func pop() -> Element?{
        //函数有返回值，如果不想使用的话，可以在函数上面添加@discardableResult取消警告
        return storage.popLast()
    }
    ///得到栈顶的元素
    func peek() -> Element?{
        storage.last
    }
    ///是否是空栈
    func isEmpty() -> Bool {
        return peek() == nil
    }
}
extension Stack:CustomDebugStringConvertible{
    ///将栈里面的数据输出,入栈顺序是1,2,3,5，则输出是5,3,2,1
    public var debugDescription: String{
        /**
         map是将数组storage元素转换到string,reverse是将数组逆序,joined是在元素之间加上分隔符号
         */
        let num = storage.map {
            "\($0)"
        }.reversed().joined(separator: "->")
        return num
    }
}

