//
//  WJLog.swift
//
//  Created by Jace on 31/03/17.
//  Copyright © 2017年 Darma. All rights reserved.
//

import UIKit

//封装的日志输出功能（T表示不指定日志信息参数类型）
func WJLog<T>(_ message:T, file:String = #file, function:String = #function,
           line:Int = #line) {
    #if DEBUG
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSS"
        //获取文件名
        let fileName = (file as NSString).lastPathComponent
        //打印日志内容
        print("\(formatter.string(from: Date()))  \(fileName)|\(line) \(function) : \(message)")
    #endif
}
