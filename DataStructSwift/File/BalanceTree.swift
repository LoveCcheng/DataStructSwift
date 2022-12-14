//
//  BalanceTree.swift
//  DataStructSwift
//
//  Created by xumin on 2022/10/12.
//

import Foundation

/**
 B树，平衡树
一个节点可以拥有超过2个子节点，按最多的子节点称呼为多少阶、比如一个B树最多的子节点为4个，则称为4阶B树
 
 m阶B树的性质（m>=2）
 假设一个节点存储的元素个数为X
 则： 根节点：1 <= x <= m-1
    非根节点：celling(m/2) - 1 <= x <= m-1   celling向上取整
    如果有子节点：子节点个数Y = x + 1
        根节点：2 <= y <= m
 非根节点：celling(m/2) <= y <= m
 
 比如m=3,为3阶B树，则 2<= y <=3 子节点个数2或者3,可以称为(2,3)树，或2-3树
 比如m=4,为4阶B树，则 2<= y <=4 子节点个数2或者3或4,可以称为(2,4)树，或2-3-4树
 
 
 添加，新添加的元素必定是添加到叶子节点
 删除，
        叶子节点，直接删除
        非叶子节点，先找到前驱或后继元素，覆盖要删除的元素的值，再把前驱或后继元素删除
        真正的删除元素都是发生在叶子节点中
 */
