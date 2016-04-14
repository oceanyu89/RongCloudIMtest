//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


import Foundation

//采用2进制方法  通过移位方式

struct InputsCheck: OptionSetType {
    let rawValue : Int
    
    static let user = InputsCheck(rawValue: 1 << 0)   //00001
    static let password = InputsCheck(rawValue: 1 << 1) // 向左移动移位 2进制图表 0010
    static let email = InputsCheck(rawValue: 1 << 2) //0100
    // 加起来111    2进制
    
}

extension InputsCheck{
    func isAllOK() -> Bool{
        //return self == [.user ,.password,.email]  第一种方法
        //return self.rawValue == 0b111 // 0b111 2进制表示   第二种方法
        
        
        let count = 3// 总数
        var found = 0//找到数量
        //遍历contains－－(rawValue: 1 << time)
        
        
        
//        for time in 0..<count where self.contains(InputsCheck(rawValue: 1 << time)){
//        found++
//        }
        
        

        for time in 0..<count{
            if self.contains(InputsCheck(rawValue: 1 << time)){
                found++
            }
        }
        
        return found == count //判断是否全部找到
        
        
    }
}
let possibleInputs : InputsCheck = [.user ,.password,.email]

possibleInputs.isAllOK()

possibleInputs.rawValue // 1+2+4