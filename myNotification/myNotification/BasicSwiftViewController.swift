//
//  BasicSwiftViewController.swift
//  myNotification
//
//  Created by 姜守栋 on 2018/1/18.
//  Copyright © 2018年 Nick.Inc. All rights reserved.
//

import UIKit

class BasicSwiftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        myArray()
        myDict()
    }

    private func myArray() {
        var types = ["none","warning","error"]  //省略类型的数组声明
        types[0] = "替换的元素"
        let newTypes = types.filter {
            $0.count < 6
        }
        print(newTypes)
    }
    
    private func myDict() {
        //（1）通过元组创建字典
        let tupleArray = [("tyd", 3), ("gn", 4), ("olp", 9)]
        let dict1 = Dictionary(uniqueKeysWithValues: tupleArray)
        print(dict1)
        //（2）通过键值序列创建字典
        let names = ["Apple", "Pear"]
        let prices = [7, 6]
        let dict2 = Dictionary(uniqueKeysWithValues: zip(names, prices))
        print(dict2)
        //（3）只有键序列、或者值序列创建字典
        let array = ["me", "you", "her"]
        let dict3 = Dictionary(uniqueKeysWithValues: zip(array, 1...))
        let dict4 = Dictionary(uniqueKeysWithValues: zip(1..., array))
        print(dict3, dict4)
        //（4）字典分组（比如下面生成一个以首字母分组的字典)
        let arr = ["me", "you", "her", "my", "hahaha", "Here"]
        let dict = Dictionary(grouping: arr) {
            $0.first!
        }
        print(dict)
        //（5）zip配合速记+可以用来解决重复键的问题（相同的键值相加）
        let array1 = ["Apple", "Pear", "Pear", "Orange"]
        let dict5 = Dictionary.init(zip(array1, repeatElement(1, count: array1.count)), uniquingKeysWith: +)
        print(dict5)
        array1.forEach {
            print($0)
        }
    }
    private func myStruct() {
        //创建一个结构体
        struct BookInfo{
            var ID:Int = 0
            var Name:String = "Defaut"
            var Author:String = "Defaut"
        }
        var book = BookInfo(ID: 1, Name: "平凡的世界", Author: "路遥")
        print(book)
    }
    
}
