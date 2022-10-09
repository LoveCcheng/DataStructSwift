//
//  HashTable.swift
//  DataStructSwift
//
//  Created by xumin on 2022/10/7.
//

import Foundation

class HashTable{
    var hashTable:[Int:Int] = [:]
    var list:[Int] = []
    var count:Int{
        get{
            return list.count
        }
    }
    init(_ lenght:Int) {
        list = Array.init(repeating: 0, count: lenght)
    }
    ///哈希函数
    func hash(_ value:Int) -> Int{
        return value % count
    }
    ///创建hashkey
    func createHashKey(_ value:Int) ->Int{
        var key = hash(value)
        if hashTable[key] != nil { //表示当前位置有值，出现冲突了
            key = conflictHandle(key)
        }
        return key
    }
    ///解决冲突
    func conflictHandle(_ value:Int) ->Int{
        var key = value
        var re = hashTable[key]
        while re != nil {
            key = (key + 1) % count
            re = hashTable[key]
        }
        return key
    }
    ///添加值
    func addValue(_ value:Int){
        let key = createHashKey(value)
        hashTable[key] = value
    }
    ///查找对应的可以
    func search(_ value:Int) ->Int{
        var key = hash(value)
        while hashTable[key] != value {
            key = (key + 1) % count
        }
        return key
    }
    ///打印
    func displayTable(){
        for key in hashTable.keys {
            print("key:\(key)---value:\(String(describing: hashTable[key]))")
        }
    }
}
